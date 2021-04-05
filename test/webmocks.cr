require "webmock"

WebMock.stub(:get, "https://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category%3A20th-century+composers&cmlimit=500&format=json&formatversion=2").to_return(status: 200, body: File.read("test/files/composers1.json"))

WebMock.stub(:get, "https://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category%3A20th-century+composers&cmlimit=500&format=json&formatversion=2&cmcontinue=page|402a3a384606042a4032583a03062a4032583a04402a3a3846011c01dcc0dcc1dcc1dc08|1059950").to_return(status: 200, body: File.read("test/files/composers2.json"))

WebMock.stub(:get, "https://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category%3A20th-century+composers&cmlimit=500&format=json&formatversion=2&cmcontinue=page|5c52402a564e3e3a0604562a564c5c5a443a322e043c324c5c5a0306562a564c5c5a443a322e045c52402a564e3e3a0125409c44b20901dcbde0bcdcc1e0bcdc0d|9880325").to_return(status: 200, body: File.read("test/files/composers3.json"))

WebMock.stub(:get, "https://en.wikipedia.org/w/api.php?action=query&prop=revisions%7Ccategories&titles=Cementite&rvslots=main&rvprop=content&formatversion=2&format=json").to_return(status: 200, body: File.read("test/files/cementite.json"))

WebMock.stub(:get, "https://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category%3AIron+compounds&cmlimit=500&format=json&formatversion=2").to_return(status: 200, body: File.read("test/files/iron-compounds.json"))

# WebMock.stub(:get, "").to_return(status: 200, body: File.read("test/files/.json"))
