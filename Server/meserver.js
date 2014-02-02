var http = require('http');
var responseBody;
http.createServer(function (req, res) {

var sql = require('mssql'); 

var config = {
    user: 'flashuser',
    password: 'D3lpH!N8',
    server: 'LUCKYPC',
    database: 'TestDB'
}

sql.connect(config, function(err) {
    // Query

    var request = new sql.Request();
	var param = req.url.split('/')[1];
	
	console.log(param.substring(0,8));
	if (param.substring(0,8) == 'savegame') {
		var username = param.substring(207,param.length);
		var userdata = param.substring(8,207);
		//console.log(param.substring(8,207));
		//console.log(param.substring(207,param.length));
		
		var sql_query = "if not exists (select top 1 1 from UserData where UserName = '" + username + 
			"') insert into UserData (UserName, TreeData) values ('" + username + "', '" + userdata + "') else update UserData set TreeData = '" +
			userdata + "' where UserName = '" + username + "'"
		
		request.query(sql_query);
		res.writeHead(200, {'Content-Type': 'text/plain'});
		res.end("");
	}
	else {
		request.query("select * from UserData where UserName = '" + param + "'", function(err, recordset) {
			if (recordset[0] == undefined) {
				responseBody = null;
			}
			else {
				responseBody = recordset[0].TreeData;
			}
			res.writeHead(200, {'Content-Type': 'text/plain'});
			res.end(responseBody);
		});
	}
});


}).listen(1337, '127.0.0.1');

console.log('Server running at http://127.0.0.1:1337/');