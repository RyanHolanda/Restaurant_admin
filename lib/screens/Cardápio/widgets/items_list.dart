import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:admin_panel/models/item_model.dart';
import 'package:admin_panel/repos/items_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_item.dart';

class Itemslist extends StatelessWidget {
  const Itemslist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsRepository().getItems();
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is AppStateIsInCardapioScreen) {
          List<ItemModel> itemsList = state.items;
          return state.isLoading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemsList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: SelectionArea(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 25, top: 25, bottom: 25, right: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 1,
                                offset: const Offset(5, 5),
                                color: Colors.grey.shade200,
                                blurRadius: 15,
                              ),
                              BoxShadow(
                                spreadRadius: 1,
                                color: Colors.grey.shade100,
                                offset: const Offset(-5, -5),
                                blurRadius: 15,
                              )
                            ],
                            color: Colors.white),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  itemsList[index].name,
                                  style: GoogleFonts.inriaSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    itemsList[index].description,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: GoogleFonts.inriaSans(
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text('Preço: ',
                                        style: GoogleFonts.inriaSans(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                    Text(
                                      'R\$ ${itemsList[index].price}',
                                      maxLines: 3,
                                      style: GoogleFonts.inriaSans(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.network(
                                  itemsList[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: MaterialButton(
                                      onPressed: () async {
                                        context.read<AppBloc>().add(
                                            AppEventDeleteItem(
                                                id: itemsList[index].id));
                                      },
                                      child: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: MaterialButton(
                                      onPressed: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditItemScreen(
                                                paused: itemsList[index].paused,
                                                id: itemsList[index].id,
                                                description: itemsList[index]
                                                    .description,
                                                price: itemsList[index].price,
                                                image: itemsList[index].image,
                                                name: itemsList[index].name,
                                              ),
                                            ));
                                      },
                                      child: const Icon(
                                        Icons.mode_edit_outlined,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: MaterialButton(
                                      onPressed: () async {
                                        context.read<AppBloc>().add(
                                            AppEventEditItem(
                                                id: itemsList[index].id,
                                                description: itemsList[index]
                                                    .description,
                                                image: itemsList[index].image,
                                                name: itemsList[index].name,
                                                price: itemsList[index].price,
                                                paused: itemsList[index].paused
                                                    ? false
                                                    : true));
                                      },
                                      child: Icon(
                                        itemsList[index].paused
                                            ? Icons.play_arrow
                                            : Icons.pause,
                                        color: itemsList[index].paused
                                            ? Colors.red
                                            : Colors.black,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
