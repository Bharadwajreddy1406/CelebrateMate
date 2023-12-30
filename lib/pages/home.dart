import 'dart:math';
import 'package:flutter/material.dart';
import 'package:_AMULYA_/pages/info.dart';
import 'dart:convert';
import 'package:_AMULYA_/pages/comet.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';



class Todo {
  String text;
  bool isCompleted;

  Todo({
    required this.text,
    this.isCompleted = false,
  });
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Todo> todos = [];
  TextEditingController taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodoList();
  }

  Future<void> _loadTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      todos = (prefs.getStringList('todos') ?? []).map((task) {
        print("n\n\n\n\n\n\n\n\t\t\t "+task+" \t\t\t \n\n\n\n\n\n");
        List<String> parts = task.split('::');
        return Todo(text: parts[0], isCompleted: parts[1] == 'true');
      }).toList();
    });
  }


  Future<void> saveTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'todos',
      todos.map((todo) => '${todo.text}::${todo.isCompleted}').toList(),
    );
  }


  void _addTodo(String todoText) {
    setState(() {
      if (todoText != "") {
        todos.add(Todo(text: todoText, isCompleted: false));
        saveTodos();
        _loadTodoList();
      }
    });
  }


  void toggleTodo(Todo todo) {
    setState(() {
      todo.isCompleted = !todo.isCompleted;
      saveTodos();
    });
  }

  void deleteTodo(Todo todo) {
    setState(() {
      todos.remove(todo);
      saveTodos();
    });
  }



  Widget _buildTodoItem(Todo todo) {
    return ListTile(
      title: Text(
        todo.text,
        style: GoogleFonts.dmSans(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            decoration: todo.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            decorationThickness: 2.0,
            decorationColor: Colors.white,
          ),
        ),
      ),
      leading: Checkbox(
        value: todo.isCompleted,
        activeColor: Colors.green,
        onChanged: (value) => toggleTodo(todo),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        color: Colors.blueGrey,
        onPressed: () => deleteTodo(todo),
      ),
    );
  }


  Future<void> datahere() async {
    const URL = 'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY';
    final response = await http.get(Uri.parse(URL));

    if (response.statusCode == 200) {
      // print('Response: ${response.body}');
      final Map<String, dynamic> responseData = json.decode(response.body);
      // print(responseData['hdurl']);

      if (!await launchUrl(Uri.parse(responseData['url']))) {
        throw "Can't open";
      }else{

      }
    } else {
      // print('Failed to load data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome..',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Color(0xFFFBCF7C),
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Comet()),
              );
            },
          ),
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.cake_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bday()),
              );
            },
          ),
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.info_outlined),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => info()),
              // );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => info()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/static/bg4.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: GlassmorphicContainer(
              width: 360,
              height: 730,
              borderRadius: 40,
              blur: 2.5,
              alignment: Alignment.topCenter,
              border: 1,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF000000).withOpacity(0.5),
                  Color((0xFF000000)).withOpacity(0.5),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.0),
                        child: Container(
                          height: 70.0,
                          // color: Colors.black,
                          child: Center(
                            child: Text(
                              "Best Photo In Space Today",
                              style:
                              TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                        ),
                      ),
                      SizedBox(
                        height: 17.0,
                      ),
                      SizedBox(
                        width: 100.0,
                        child: FloatingActionButton(
                          onPressed: () {
                            datahere();
                          },
                          child: Text("O P E N"),
                          backgroundColor: Color(0xFF1A212A),
                          focusColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          elevation: 6.0,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: SingleChildScrollView(
                          child: GlassmorphicContainer(
                            width: 360,
                            height: 555,
                            borderRadius: 40,
                            blur: 9,
                            alignment: Alignment.topCenter,
                            border: 1,
                            linearGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF000000).withOpacity(0.1),
                                  Color(0xFF000000).withOpacity(0.05),
                                ],
                                stops: [
                                  0.1,
                                  1,
                                ]),
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF000000).withOpacity(0.5),
                                Color((0xFF000000)).withOpacity(0.5),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 75.0,
                                    width: 340,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0A0D11),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40.0),
                                        topLeft: Radius.circular(40.0),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text("To Do List",
                                        style: GoogleFonts.dmSans(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),),
                                    ),
                                  ),
                                ),
                                Container(child: ListView.builder(
                                  itemCount: todos.length,
                                  itemBuilder: (context, index) {
                                    return _buildTodoItem(todos[index]);
                                  },
                                ),
                                height: 465,)
                              ],
                            ),
                            ),
                        ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFffffff),

        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add To Do'),
                content: TextField(
                  autofocus: true,
                  onSubmitted: (String value) {
                    _addTodo(value);
                    Navigator.pop(context);
                  },
                ),
              );
            },
          );
        },
        tooltip: "made by Bharadwaj Reddy",
        child: Icon(Icons.add,
        color: Colors.black,),
      ),
    );
  }
}

class Bday extends StatefulWidget {
  const Bday({super.key});

  @override
  State<Bday> createState() => _BdayState();
}

class _BdayState extends State<Bday> {

  final List<String> strings = ["Hi Amulya, firstly Happy Birthday Ammu sorry "
      "stress buster, everytime when life goes really dull and flat your squeaky"
      " laugh and the child in you brings laughter and joy out of us and I need to"
      " thank you for existing in our lives and all I can say is I love your "
      "presence in my dull and flat life so that you bring light and laughter"
      " in our day 🤗  ", "Happy happier happiest birthday ammu kukka"
      " nakka pandhi dhunna, vove youuuuuuu kukkaaa. Iam sure this birthday "
      "will be better than previous year b'day and iam sure that nik school lo "
      "bday celebration jeragale ani feel ayyav malli ala kakunda chuskunta."
      " Let's have a great day ammuuuu. Pink cutie😍   From-kukka🤗",
    "Remember that you are not a chetha kukka.", "It's okay to not be okay at times,"
        " but you are our cute pandi so you will be okay real soon.", "Life is like"
        " squid game, so get up and work bish.Go out and buy yourself something you"
        " like, cuz you ain't got any Duan jiaxu in your life.",
    "Life is short (not as short as you), so go and annoy the shit out of your favorite person.",
    "Have you made any awkward eye contacts today?",
    "Happy Birthday to my short and chubby bundle of joy! Your infectious"
        " laughter bring so much happiness to our lives. Cheers to another "
        "year of joy and Happiness.",
    "I Would always call you when I am stressed so we can be stressed together.I"
        " Would always force my friends to come to your room whenever we cross your hostel. "
        "I Would always convince you to bunk.I Would always ask you whenever I go "
        "somewhere Cause I know I can count on you. HAPPY BIRTHDAY MANCHI KUKKA "
        "~Oka manchi kukka",
    "Happy Birthday! Wishing many many happy returns of the day to the most lively,"
        " sweet, and uniquely wonderful person I've ever met."
    ,"Hey Dayyam,When i thought of writing something for you, I didn't know what to "
        "write, and so i wanted to write something that you can read after a long time,"
        " when we may or may not be in contact with each other,So lets start,Hope your"
        " happy and also hope reading this makes you happy, I don't know if i am with "
        "you or not but if i am not i know i will be missing you, and sometimes i do "
        "a lot of stupid things so if i ever hurt you just forgive this idiotic big "
        "brother of yours, beat him a little if you want but don't get angry on him, "
        " that's about me , now about you for real your one of the cattiest people "
        "i met and shortest one (in my friends), i would feel better if you are a "
        "little more selfish and get rid of your shyness and i know you think you "
        "have to loss weight but u don't , and if you have to loss weight don't stop"
        " eating but do more exercise, hope you laugh more, remember this if you ever "
        "need anything i will be there for you, even if i am angry with you about "
        "something , i don't care ,if you need help i will be there, it is not just "
        "about help , if you ever need someone to talk to , call me ,don't think if"
        " i am busy or free just call me and also that will make me happy when you "
        "call me. Love you Dayyam   -Bye" , "Wishing the happiest birthday to you"
        " AMMU 😁 ! Nu Untene pandaga 🤩 , Nu lekapothe Dandaga 🥲, I totally enjoy"
        " when I'm with you. Your kindness, and innocence and cute Zoning out"
        " Moments are the things i Love the most ."
        "Today is all about celebrating the Beautiful day of this year . Ee year "
        " Enjoyment Icchepadeddham , thaggedhe le , Ee year nu height peruguthav pakka."
        "You will be My Dummy Drummu of My Btech 😊 , Lessgooo and have a Year full"
        " of memories ahead  - Bahubali 😏  ","Dec 1 roju andhar intikada untar… 😂",
    "Happy Birthday mummyyyy!!! Height thakkuvaina you entertained us more than "
        "everyone.You never failed to unite kuks everytime.You're centre of "
        "attraction of kuks.i won't say you're a stress buster but you sure are"
        " mood changer.Sudden ga chinna pillalam aipotham nee chuttu instant "
        "sticker material nuvvu😂. Hopefully next birthday kalla atleast 1 inch"
        " perguthav ani ashisthunna.Happy birthday once again mummy    -nee sontha koduku😏",
    "Hey happy kid You're the one I can talk to when I don't have anything nice to"
        " say. Chinna chinna vishayalaku yedvadam apay. you actually deserve a"
        " prize and a slap for being the most annoying ❤"];

  // I have collected these from my friends , you change them with yours 


  String _selectedString  = "";

  @override
  void initState() {
    super.initState();
    _selectRandomString();
  }

  void _selectRandomString() {
    final randomIndex = Random().nextInt(strings.length);
    setState(() {
      _selectedString = strings[randomIndex];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hii AMULYA..',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFFFBCF7C),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/static/img.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: GlassmorphicContainer(
              width: 360,
              height: 680,
              borderRadius: 40,
              blur: 2,
              alignment: Alignment.topCenter,
              border: 1,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF000000).withOpacity(0.5),
                  Color((0xFF000000)).withOpacity(0.5),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: Padding(padding: EdgeInsets.all(20.0),
                          child: Text(
                            "$_selectedString",
                            style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// IT was for my friend though ,
// it's the first project I ever made after learning flutter
// It's very special to me ❤️
