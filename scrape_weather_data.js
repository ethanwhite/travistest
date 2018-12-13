var webPage = require('webpage');
var page = webPage.create();

var fs = require('fs');
var path = 'data_table.html'

page.open('http://166.153.133.121/?command=TableDisplay&table=MET&records=10', function (status) {
  var content = page.content;
  fs.write(path,content,'w')
  phantom.exit();
});
