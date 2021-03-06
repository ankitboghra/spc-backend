var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var cors = require('cors');

var index = require('./routes/index');
var program = require('./routes/program');
var areaofinterest = require('./routes/areaofinterest');
var forgotpass = require('./routes/forgotpassword');
var user = require('./routes/user');
var changePassword = require('./routes/changePassword');
var company = require('./routes/company');
var sprofile = require('./routes/studentProfile');
var question = require('./routes/question');
var placedstudent = require('./routes/placedstudent');
var interviewexperience = require('./routes/interviewexperience');
var interviewround = require('./routes/interviewround');
var interviewrounddetail = require('./routes/interviewrounddetail');



var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(cors());
app.use(logger('dev'));
app.use(bodyParser.json({ limit: '50mb' }));
app.use(bodyParser.urlencoded({ limit: '50mb', extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', index);
app.use('/program', program);
app.use('/areaofinterest', areaofinterest);
app.use('/forgotpassword', forgotpass);
app.use('/user', user);
app.use('/changePassword', changePassword);
app.use('/company', company);
app.use('/studentProfile', sprofile);
app.use('/question', question);
app.use('/placedstudent', placedstudent);
app.use('/interviewexperience', interviewexperience);
app.use('/interviewround', interviewround);
app.use('/interviewrounddetail', interviewrounddetail);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
