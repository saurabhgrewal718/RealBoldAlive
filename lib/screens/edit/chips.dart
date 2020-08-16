import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';

class Chips extends StatefulWidget {
  static const routeName ='./chips';
  @override
  _ChipsState createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {

  int tag = -1;
  int tags = -1;
  final _formKey = GlobalKey<FormState>();

  List<String> options = [
    'News', 'Entertainment', 'Politics',
    'Automotive', 'Food', 'Tech',
    'Science',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ChipsChoice'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {} 
            // _about(context),
          )
        ],
      ),
      body: Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(5),
        children: <Widget>[
          Content(
            title: 'Custom Choice Widget',
            child: ChipsChoice<int>.single(
              value: tag,
              options: ChipsChoiceOption.listFrom<int, String>(
                source: options,
                value: (i, v) => i,
                label: (i, v) => v,
              ),
              itemBuilder: (item, selected, select) {
                return CustomChip(item.label, selected, select);
              },
              onChanged: (val) {
                setState(() {
                  tag=val;
                });
              },
            ),
          ),
          
         Content(
            title: 'Works with FormField and Validator',
            child: FormField<int>(
              autovalidate: true,
              initialValue: tags,
              validator: (value) {
                if (value<0) {
                  return 'Please select some categories';
                }
                return null;
              },
              builder: (state) {
                return Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: ChipsChoice<int>.single(
                        value: tags,
                        options: ChipsChoiceOption.listFrom<int, String>(
                          source: options,
                          value: (i, v) => i,
                          label: (i, v) => v,
                        ),
                        itemBuilder: (item, selected, select) {
                          return CustomChip(item.label, selected, select);
                        },
                        onChanged: (val) {
                          setState(() {
                            tags=val;
                            print(tags);  
                          });
                        },
                      ),
                    ),
           
                    // )
                  ],
                );
              },
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width*0.4,
            padding: EdgeInsets.only(top: 3, left: 3),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border(
                bottom: BorderSide(color: Colors.black),
                top: BorderSide(color: Colors.black),
                left: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
              )
            ),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 50,
              // onPressed:showOptions,
              onPressed: (){
                print(_formKey.currentState);
              },
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
              ),
              child: Text('Submit', style: TextStyle(
                fontWeight: FontWeight.w600, 
                fontSize: 18,
                color: Colors.black
              ),),
            ),
          ),

          
        ],

      ),

      ),
      
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomChip extends StatelessWidget {

  final String label;
  final bool selected;
  final Function(bool selected) onSelect;

  CustomChip(
    this.label,
    this.selected,
    this.onSelect,
    { Key key }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 100,
      width: 70,
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: selected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: selected ? Colors.green : Colors.grey,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () => onSelect(!selected),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Visibility(
              visible: selected,
              child: Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 32,
              )
            ),
            Positioned(
              left: 9,
              right: 9,
              bottom: 7,
              child: Container(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black45,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {

  final String title;
  final Widget child;

  Content({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            color: Colors.blueGrey[50],
            child: Text(
              title,
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
