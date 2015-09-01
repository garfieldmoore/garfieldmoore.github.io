require "jekyll-import";
    JekyllImport::Importers::WordpressDotCom.run({
      "source" => "garfieldmoore.wordpress.2015-08-28.xml",
      "no_fetch_images" => false,
      "assets_folder" => "assets"
    })