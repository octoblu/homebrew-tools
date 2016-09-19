class Travisify < Formula
  desc "Create a travis yaml and enable travis"
  url "https://github.com/octoblu/node-dev-tools/archive/v3.1.2.tar.gz"
  version "3.1.2"
  sha256 "f8574274eb8d653cb12925489fc87310ce269b85d785055457c32002e1e09312"
   
  def install
    inreplace "bash/travisify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/travisify\""
    bin.install "bash/travisify"
    var.install "templates/travisify"
  end
end
