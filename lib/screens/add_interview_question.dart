import 'package:flutter/material.dart';

class AddInterviewQuestionScreen extends StatefulWidget {
  AddInterviewQuestionScreen({Key key}) : super(key: key);

  @override
  _AddInterviewQuestionScreenState createState() =>
      _AddInterviewQuestionScreenState();
}

class _AddInterviewQuestionScreenState
    extends State<AddInterviewQuestionScreen> {
  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _descriptionEditingController = TextEditingController();
  TextEditingController _tagEditingController = TextEditingController();

  String _currentTag = '';
  List<String> _tags = [];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tagEditingController.addListener(() {
      setState(() {
        _currentTag = _tagEditingController.text;
      });
    });
  }

  void _onSave() {
    if (_formKey.currentState.validate()) {
      print('🔥🔥🔥');
      print(_titleEditingController.text.trim());
      print(_descriptionEditingController.text.trim());
      print(_tags.length);
    }
  }

  bool get _isValidTag => _currentTag.trim().length >= 2; // 태그의 글자 수 제한

  void _addTag() {
    // if(_tagEditingController.text.)
    setState(() {
      _tags.add(_tagEditingController.text);
      _tagEditingController.clear();
      _currentTag = '';
    });
  }

  void _removeTag(int index) {
    setState(() {
      _tags.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('인터뷰 질문 올리기'),
          actions: <Widget>[
            FlatButton(
              child: Text('게시'),
              onPressed: _onSave,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTitleInput(),
                Divider(),
                _buildDescriptionInput(),
                Divider(),
                _buildTagInput(),
                _buildTagList(),
              ],
            ),
          ),
        ));
  }

  Widget _buildTitleInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: _titleEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "인터뷰 질문을 입력하세요",
        ),
        validator: (value) {
          if (value.trim().length < 5) {
            return '인터뷰 질문이 너무 짧아요 (5자 이상 입력)';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDescriptionInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: _descriptionEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '질문에 설명을 더해보세요',
        ),
        maxLines: 4,
      ),
    );
  }

  Widget _buildTagInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _tagEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '태그를 추가해 보세요',
              ),
            ),
          ),
          FlatButton(
            child: Text('추가'),
            onPressed: _isValidTag ? _addTag : null,
          )
        ],
      ),
    );
  }

  Widget _buildTagList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        children: List.generate(
          _tags.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '#${_tags[index]}',
                  style: TextStyle(color: Colors.blue),
                ),
                _buildDismissIcon(
                  onTap: () => _removeTag(index),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDismissIcon({Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Icon(Icons.close),
    );
  }
}
