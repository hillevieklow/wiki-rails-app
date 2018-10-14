u1 = User.create(:name => "Hillevi", :email => "hillevi@domain.com", :password => "test")
u2 = User.create(:name => "Jenny", :email => "jenny@domain.com", :password => "test", :admin => "true")
u3 = User.create(:name => "Linnea", :email => "linnea@domain.com", :password => "test")

a1 = Article.create(:title => "Types of Succulents", :content => "Lorem ipsum dolor sit amet, per dicunt regione scripserit ad, id ius quodsi appareat, unum erat legendos eos in. Duis animal ei vel. Vis debitis mandamus ut, dolorem fastidii at sit, unum vidit malis eu mei. Eam deserunt appellantur et, vis soluta placerat cu. Has ea corpora dissentiunt liberavisse, legere moderatius nec in, ne cum debitis adipiscing.", :user_id => 1)
a2 = Article.create(:title => "Merry Christmas", :content => "Quaeque offendit ut qui. At posse vocent qui, vix numquam pericula petentium ad. Mea ad amet liberavisse. At vidit error percipitur pri, ius ei quod fugit concludaturque, ad duo detraxit efficiantur neglegentur. Ex pro quod animal conclusionemque, in mel facilisis intellegat temporibus, per ut nusquam indoctum. Usu ad affert virtute, deleniti posidonium ad mel.", :user_id => 1)
