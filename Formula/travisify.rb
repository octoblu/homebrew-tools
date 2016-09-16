class Travisify < Formula
  desc "Create a travis yaml and enable travis"
  url "https://github.com/octoblu/node-dev-tools/archive/v3.1.1.tar.gz"
  version "3.1.1"
  sha256 "7170722987d6b1f90ec9c04d9dbbee32ba7b32f7ab94406f3c14af965b4f07bd"
   
  def install
    inreplace "bash/travisify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/travisify\""
    bin.install "bash/travisify"
    var.install "templates/travisify"
  end
end
