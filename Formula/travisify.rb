class Travisify < Formula
  desc "Create a travis yaml and enable travis"
  url "https://github.com/octoblu/node-dev-tools/archive/v3.1.0.tar.gz"
  version "3.1.0"
  sha256 "6e0ac7ffde67e04b55425b93e76967f8363fbad07a087d78b619a327c42843cf"
   
  def install
    inreplace "bash/travisify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/travisify\""
    bin.install "bash/travisify"
    var.install "templates/travisify"
  end
end
