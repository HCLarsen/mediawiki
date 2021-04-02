require "webmock"

Webmock.stub(:get, "https://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:Iron_compounds&cmlimit=100&format=json&formatversion=2").to_return(status: 200, body: File.read("test/files/iron-compounds1.json"))

Webmock.stub(:get, "https://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:Iron_compounds&cmlimit=100&format=json&formatversion=2&cmcontinue=age|4e3a30324c3a5032010c01dc0b|875418&continue=-||").to_return(status: 200, body: File.read("test/files/iron-compounds2.json"))

Webmock.stub(:get, "https://en.wikipedia.org/w/api.php?action=query&prop=revisions%7Ccategories&titles=Cementite&rvslots=main&rvprop=content&formatversion=2&format=json").to_return(status: 200, body: File.read("test/files/cementite.json"))

# Webmock.stub(:get, "").to_return(status: 200, body: File.read("test/files/.json"))
