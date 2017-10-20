# README


`rails new week1`

`cd week1`

`rails generate model Book name:string author:string`

Edit db/seeds.rb

```rb
Book.create( name:"1984", author:"George Orwell" )
Book.create( name:"Zen principle", author:"Osho" )
Book.create( name:"The White Cat and the Monk", author:"Jo Ellen Bogart" )
```

`rake db:migrate`

`rake db:seed`

Quicky test the DB

`rails dbconsole`

```
SQLite version 3.16.0 2016-11-04 19:09:39
Enter ".help" for usage hints.

sqlite> select * from books;

1|1984|George Orwell|2017-10-19 23:46:52.539075|2017-10-19 23:46:52.539075
2|Zen principle|Osho|2017-10-19 23:46:52.543506|2017-10-19 23:46:52.543506
3|The White Cat and the Monk|Jo Ellen Bogart|2017-10-19 23:46:52.545472|2017-10-19 23:46:52.545472

sqlite> .exit

```

Quicky test the Rails environment

`rails console`

```
Running via Spring preloader in process 22819
Loading development environment (Rails 5.1.4)

irb(main):001:0> Book.all

  Book Load (0.8ms)  SELECT  "books".* FROM "books" LIMIT ?  [["LIMIT", 11]]
=> #<ActiveRecord::Relation [#<Book id: 1, name: "1984", author: "George Orwell", created_at: "2017-10-19 23:46:52", updated_at: "2017-10-19 23:46:52">, #<Book id: 2, name: "Zen principle", author: "Osho", created_at: "2017-10-19 23:46:52", updated_at: "2017-10-19 23:46:52">, #<Book id: 3, name: "The White Cat and the Monk", author: "Jo Ellen Bogart", created_at: "2017-10-19 23:46:52", updated_at: "2017-10-19 23:46:52">]>

irb(main):002:0> Book.first

  Book Load (0.3ms)  SELECT  "books".* FROM "books" ORDER BY "books"."id" ASC LIMIT ?  [["LIMIT", 1]]
=> #<Book id: 1, name: "1984", author: "George Orwell", created_at: "2017-10-19 23:46:52", updated_at: "2017-10-19 23:46:52">
irb(main):003:0> 
```

`rails generate controller Books`

Add the *index action* at **app/controllers/book_controller.rb**:

```ruby
class ApplicationController < ActionController::Base

    def index
    end

end
```

Create view **app/views/books/index.html.erb**:

```
<% Book.all.each do |bk| %>

    - Name: <%=bk.name%>, Author <%=bk.author%> <br>

<% end %>
```

