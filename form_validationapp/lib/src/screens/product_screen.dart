import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validationapp/src/providers/product_form_provider.dart';
import 'package:form_validationapp/src/services/product_service.dart';
import 'package:form_validationapp/src/ui/input_decorations.dart';
import 'package:form_validationapp/src/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
        child: _ProductScreenBody(productService: productService),
        create: (_) => ProductFormProvider(productService.selectedProduct));
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              ProductImageWidget(url: productService.selectedProduct.picture),
              Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 40.0,
                        color: Colors.white,
                      ))),
              Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final PickedFile? pickedFile = await picker.getImage(
                            // source: ImageSource.gallery,
                            source: ImageSource.camera,
                            imageQuality: 100);

                        if (pickedFile == null) {
                          print('No seleccionó nada');
                          return;
                        }
                        print('tenemos imagen ${pickedFile.path}');
                        productService
                            .updateSelectedProductImage(pickedFile.path);
                      },
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 40.0,
                        color: Colors.white,
                      ))),
              const SizedBox(height: 100)
            ],
          ),
          const _ProductForm(),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_alt_outlined),
        onPressed: productService.isSaving
        ? null
        : () async {
          if (!productFormProvider.isValidForm()) return;
          final String? imageUrl = await productService.uploadImage();
            print(imageUrl);
          if ( imageUrl != null ) productFormProvider.product.picture = imageUrl;

          await productService.saveOrCreateProduct(productFormProvider.product);
        },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);

    final product = productFormProvider.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          height: 250,
          decoration: _buildBoxDecoration(),
          child: Form(
              key: productFormProvider.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    initialValue: product.name,
                    onChanged: (value) => product.name = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You must write your name';
                      }
                    },
                    decoration: InputDecorations.authInputDecoration(
                        hintText: 'Name of the product', labelText: 'Name'),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    initialValue: '${product.price}',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    onChanged: (value) {
                      if (double.tryParse(value) == null) {
                        product.price = 0;
                      } else {
                        product.price = double.parse(value);
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecorations.authInputDecoration(
                        hintText: 'Price of the product', labelText: 'Price'),
                  ),
                  const SizedBox(height: 30),
                  SwitchListTile.adaptive(
                      title: const Text('Available'),
                      activeColor: Colors.green,
                      value: product.available,
                      onChanged: productFormProvider.updateAvailability)
                ],
              ))),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ]);
  }
}
