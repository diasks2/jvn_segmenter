JRuby Sinatra app (deployable to Heroku) for JVnSegmenter
=======

[JVnSegmenter](http://jvnsegmenter.sourceforge.net/) is a Java-based Vietnamese Word Segmentation Tool. Special thanks to [@djellemah](https://github.com/djellemah) for teaching me some JRuby and doing all the hard work to make this work. This Sinatra/Heroku skeleton was stolen from [here](https://github.com/rpocklin/jruby-sinatra-heroku-skeleton). 

```ruby
# "Nó là một bản tuyên ngôn đặc sắc của chủ nghĩa nhân đạo , một tiếng chuông cảnh tỉnh trước hiểm họa lớn lao của hành tinh trước sự điên rồ của những kẻ cuồng tín ."
curl -d 'text=N%C3%B3%20l%C3%A0%20m%E1%BB%99t%20b%E1%BA%A3n%20tuy%C3%AAn%20ng%C3%B4n%20%C4%91%E1%BA%B7c%20s%E1%BA%AFc%20c%E1%BB%A7a%20ch%E1%BB%A7%20ngh%C4%A9a%20nh%C3%A2n%20%C4%91%E1%BA%A1o%20%2C%20m%E1%BB%99t%20ti%E1%BA%BFng%20chu%C3%B4ng%20c%E1%BA%A3nh%20t%E1%BB%89nh%20tr%C6%B0%E1%BB%9Bc%20hi%E1%BB%83m%20h%E1%BB%8Da%20l%E1%BB%9Bn%20lao%20c%E1%BB%A7a%20h%C3%A0nh%20tinh%20tr%C6%B0%E1%BB%9Bc%20s%E1%BB%B1%20%C4%91i%C3%AAn%20r%E1%BB%93%20c%E1%BB%A7a%20nh%E1%BB%AFng%20k%E1%BA%BB%20cu%E1%BB%93ng%20t%C3%ADn%20.key=yourKey' http://your-app.herokuapp.com
# => {"0":["Nó"],"1":["là"],"2":["một"],"3":["bản"],"4":["tuyên ngôn"],"5":["đặc sắc"],"6":["của"],"7":["chủ nghĩa"],"8":["nhân đạo"],"9":["một"],"10":["tiếng"],"11":["chuông"],"12":["cảnh tỉnh"],"13":["trước"],"14":["hiểm họa"],"15":["lớn lao"],"16":["của"],"17":["hành tinh"],"18":["trước"],"19":["sự điên rồ"],"20":["của"],"21":["những"],"22":["kẻ"],"23":["cuồng tín"]}
```

Instructions
-----------

**Check this code out from github.**  
`$ git clone git://github.com/diasks2/jvn_segmenter.git`  

**Go into the project directory and run:**  
`$ jruby -S gem install bundler heroku`  

**Generate your Gemfile.lock and load dependencies:**  
`$ jruby -S bundle install`  

**Duplicate the Gemfile to Jemfile so that heroku knows its a JRuby app.**  
`$ cp Gemfile Jemfile`  
`$ cp Gemfile.lock Jemfile.lock`  

**Initialise GIT**  
`$ git init`  
`$ git add .`  
`$ git commit -m "Initial commit"`  

**Initialise and push to Heroku (with cedar stack for java) this will give you the application URL (can be renamed by logging in to heroku.com)**  
`$ heroku create --stack cedar --buildpack http://github.com/heroku/heroku-buildpack-java.git`  
`$ git push heroku master`  

**Set your KEY environmental variable on Heroku**  
`$ heroku config:set KEY=yourKey`  

Other useful commands
-----------

Start local server: `$ rackup`  