class Travisify < Formula
  desc "Create a travis yaml and enable travis"
  url "https://github.com/octoblu/node-dev-tools/archive/v3.3.2.tar.gz"
  version "3.3.2"
  sha256 "f1e7936d152c779e517b689b1b87b9eb11d90d07704594c2753a37dff410a7b8"
   
  def install
    inreplace "bash/travisify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/travisify\""
    bin.install "bash/travisify"
    var.install "templates/travisify"
  end
end
