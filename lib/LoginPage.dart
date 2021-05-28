import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';


class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  int count = 0;
  int cnt =0;
  int msg =0;
  int like = 46;
  int Comment = 4;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _controller = new ScrollController();


  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value),
      duration: Duration(seconds: 1),)
    );
  }


  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    _controller.addListener(_textListener);
  }

  _scrollListener() {
    setState(() {
      _scrollPosition = _controller.position.pixels;
      if(_scrollPosition > 1550){
        shoudHideBootomBar = false;
      }
      else{
        shoudHideBootomBar = true;
      }
    });
  }

  _textListener() {
    setState(() {
      _scrollPosition = _controller.position.pixels;
      if(_scrollPosition == 0 || _scrollPosition == null){
        showtext = false;
      }
      else{
        showtext = true;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  double _scrollPosition;

  bool shoudHideBootomBar = true;

  bool showtext = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Bluepad',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.home),
          color: Colors.black,
          onPressed: (){
            showInSnackBar('Home button pressed.');
          },
        ),
      ),
      bottomNavigationBar: NotificationListener<ScrollEndNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels/notification.metrics.minScrollExtent;
          setState(() {
            progress = "${(progress*100).toInt()}%" as double;
          });
          print('Position $_scrollPosition pixels');
          // var metrics = notification.metrics;
          // if (metrics.atEdge) {
          //   if (metrics.pixels == 0) showInSnackBar('You reached the top of the screen');//print('At top');
          //   else showInSnackBar('You reached the bottom of the screen'); //print('At bottom');
          // }
          return true;
        },
        child: Visibility(
          visible: shoudHideBootomBar,
          child: BottomNavigationBar(
            items: [
              count==0?
              BottomNavigationBarItem(
                  icon: InkWell(
                      child: Icon(Icons.thumb_up_alt_outlined, color: Colors.black,),
                    onTap: (){
                      setState(() {
                        count++;
                        like++;
                      });
                    },
                  ),
                  title: Text(
                    'Like',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor: Colors.white
              ):
              BottomNavigationBarItem(
                  icon: InkWell(
                      child: Icon(Icons.thumb_up, color: Colors.black,),
                    onTap: (){
                      setState(() {
                        count--;
                        like--;
                      });
                    },
                  ),
                  title: Text(
                    'Like',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor: Colors.white
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.messenger_outline, color: Colors.black,),
                  title: Text(
                    'Comment',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                    ),
                  ),
                  backgroundColor: Colors.white
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.share, color: Colors.black,),
                  title: Text('Share',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor: Colors.white
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.save_alt, color: Colors.black,),
                  title: Text('Share',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor: Colors.white
              ),
            ],
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              iconSize: 20,
              onTap: _onItemTapped,
              elevation: 5
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(bottom: 65, top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rise of Online content creators',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: Icon(Icons.ac_unit_outlined, color: Colors.white,size: 30,),
                      ),

                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amruta Subhekar',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text('Mar 23, 2021',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '"To be an artist is to believe in life."',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              fontSize: 20
                          ),
                        ),
                        TextSpan(
                          text: ' - Henry Moore',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Text(
                    'The true essence of life is art. One which has been enjoyed through millions of'
                        ' years through multiple cultures and artforms. From the early caveman paintings to the latest '
                        'TikTok. All of them can be considered a form of art. Art is subjective.'
                        ' Art is supposed to evoke emotions and make the observer feel life as it happens.',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Image.asset('image/logo.png',height: 200,width: MediaQuery.of(context).size.width,),

                  SizedBox(
                    height: 40,
                  ),

                  Text(
                    'Art which was relegated to the backgrounds is finally making its move into life as'
                        'a mainstream activity. Humans are a creative set of folks, and will eventually spend more time in'
                        'creating art rather than labouring themselves over joyless tasks. The rise of automation has'
                        'given time to people. Coupled with technological advances we now have one of the'
                        'biggest opportunities in the world to make our mark on this world. Gone are the times when'
                        'people would consider artists as a starving bunch. Gone are the days when success and'
                        'fame were decided by the executives in the movie studios. Gone are the days of'
                        'gatekeeping fame.',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Text(
                    'Online content creators are amongst the most sought after '
                        'career opportunities for young kids. The need to loosen up and find'
                        ' meaning in life rather than paying bills. Platforms in every genre '
                        'have popped up from video to writing to even painting. Couple this up '
                        'with e-commerce and you get a deadly combination of a new distribution '
                        'channel. This is known as influencer marketing.',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Text(
                    'Consumption of content has been democratized and hence the '
                        'concentration of it has reduced over time. From the entire country watching 4 '
                        'tv shows at 8:30 PM to numerous online channels and access to top-notch '
                        'information, the era of marketing has changed. And marketing brings in money to '
                        'these content creators who can tap into their local community and sell products '
                        'relevant to them.',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Text(
                    'The world has changed. Rather than being a doctor, engineer'
                        ' or lawyer, careers have evolved and so people who would have struggled'
                        ' in the traditional sectors have enjoyed tremendous success in their '
                        'life due to these opportunities.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(
                    height: 160,
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  like==46?
                  Text(
                    '46 Likes',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ):Text(
                    '${like.toString()} Likes',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),

                  Comment==4?
                  Text(
                    '4 Comment',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[700],
                    ),
                  ):Text(
                    '${Comment.toString()} Comment',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[700],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30,),

            Kdivider,

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      count==0?
                      IconButton(
                          icon: Icon(Icons.thumb_up_alt_outlined, size: 20,),
                          onPressed: (){
                            setState(() {
                              count++;
                              like++;
                            });
                          }
                      ) :
                      IconButton(
                          icon: Icon(Icons.thumb_up_sharp, size: 20,),
                          onPressed: (){
                            setState(() {
                              count--;
                              like--;
                            });
                          }
                      ),

                      count==0?
                      Text(
                        'Like',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ):Text(
                        '${count.toString()} Like',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [

                      msg==0?
                      IconButton(
                          icon: Icon(Icons.messenger_outline,size: 20,),
                          onPressed: (){
                            setState(() {
                              msg++;
                              Comment++;
                            });
                          }
                      ):IconButton(
                          icon: Icon(Icons.messenger,size: 20,),
                          onPressed: (){
                            setState(() {
                              msg--;
                              Comment--;
                            });
                          }
                      ),

                      msg==0?
                      Text(
                        'Comment',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ):Text(
                        '${msg.toString()} Comment',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.share_outlined,size: 20,),
                          onPressed: (){

                          }
                      ),
                      Text(
                        'Share',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.save_alt,size: 20,),
                          onPressed: (){

                          }
                      ),
                      Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

            SizedBox(height: 20,),

            Kdivider,

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Icon(Icons.ac_unit_outlined, color: Colors.white,size: 30,),
                ),

                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amruta Subhekar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text('Mar 23, 2021',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 55,),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(45.0), //                 <--- border radius here
                    ),
                  ),
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: 20,),

            Kdivider,

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 30,
                  child: Text(
                    'D',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Colors.white
                    ),
                  ),
                ),

                Container(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Write a Comment",
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20,),

            Kdivider,

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 16),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black45,
                        child: Text(
                          'A',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anu Jadhav',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text('Appreciate your work! Keep Writing',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    SizedBox(width: 20,),

                    cnt==0?
                    InkWell(
                      onTap: (){
                        setState(() {
                          cnt++;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.favorite_border, size: 20,),
                          SizedBox(width: 5,),
                          Text(
                              '$cnt Like'
                          ),
                        ],
                      ),
                    ):InkWell(
                      onTap: (){
                        setState(() {
                          cnt--;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.favorite, size: 20, color: Colors.red,),
                          SizedBox(width: 5,),
                          Text(
                              '$cnt Like'
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.message_outlined, size: 20,),
                        SizedBox(width: 5,),
                        Text('Reply'),
                      ],
                    ),

                    Text(
                      'Mar 23, 2021',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                  ],
                ),
              ],
            ),

            SizedBox(width: 20,),

            Kdivider,

            SizedBox(width: 30,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.favorite, color: Colors.pink[300],)
                      ),

                      SizedBox(width: 15,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kiran Bhosale',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text('Art is the primary purpose of life. Everything else is there to support it',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    SizedBox(width: 20,),

                    Row(
                      children: [
                        Icon(Icons.favorite_border, size: 20,),
                        SizedBox(width: 5,),
                        Text(
                            '1 Like'
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.message_outlined, size: 20,),
                        SizedBox(width: 5,),
                        Text('Reply'),
                      ],
                    ),

                    Text(
                      'Mar 23, 2021',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text(
                    'view 1 replies',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20,),

            Kdivider,

            SizedBox(height: 30,),

            Visibility(
              visible: showtext,
              child: Text('You reached the bottom of the screen'),
            ),

          ],
        ),
      ),
    );
  }
}


