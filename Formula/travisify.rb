class Travisify < Formula
  desc "Create a travis yaml and enable travis"
  url "https://github.com/octoblu/node-dev-tools/archive/v3.3.3.tar.gz"
  version "3.3.3"
  sha256 "2e3a7e9b95710e8d4aec840f95b07f93f5b6ef9b4209a56b66c52ed2fd7af78f"
   
  def install
    inreplace "bash/travisify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/travisify\""
    bin.install "bash/travisify"
    var.install "templates/travisify"
  end
end
