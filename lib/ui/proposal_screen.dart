import 'package:avtoservicelocator/bloc/common/bloc_provider.dart';
import 'package:avtoservicelocator/bloc/proposal_bloc.dart';
import 'package:avtoservicelocator/model/proposal_item.dart';
import 'package:avtoservicelocator/ui/proposal_screen_item.dart';
import 'package:flutter/material.dart';

class ProposalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProposalScreenState();
}

class _ProposalScreenState extends State<ProposalScreen> {
  ProposalBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.context = context;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Ответы на заявку"),
        ),
        body: StreamBuilder(
          stream: _bloc.outProposalItems,
          builder: (BuildContext context,
              AsyncSnapshot<List<ProposalItem>> snapshot) {
            if (snapshot.data == null || snapshot.data.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                  padding: EdgeInsets.all(0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ProposalScreenItem(snapshot.data[index], _bloc),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(thickness: 5, color: Colors.black12,));
            }
          },
        ),
      );
}
