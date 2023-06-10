class AppConst{
  static String url="https://jsonkeeper.com/b/N8T9";

  static String jsonData="""
{
  "type":"Container",
  "color":"#FFFFFF",
  "alignment":"center",
  "child":{
    "type":"Container",
    "child":{
      "type":"Column",
      "mainAxisAlignment":"center",
      "children":[
        {
          "type":"FlatButton",
          "color":"#FF0000",
          "textColor":"#FFFFFF",
         "onPressed": "navigatePage()",
          "child":{
            "type":"TranslatedText",
            "data":"Go to the next page"
          }
        },
        {
          "type":"FlatButton",
          "color":"#FF0000",
          "textColor":"#FFFFFF",
          "onPressed": "${print}",
          "child":{
            "type":"TranslatedText",
            "data":"Redirect to the next page"
          }
        }
      ]
    }
  }
}

  
  """;


}

printText() {
  print("hello");
}

