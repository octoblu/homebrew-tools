class Travisify < Formula
  desc "Create a travis yaml and enable travis"
  url "https://github.com/octoblu/node-dev-tools/archive/v3.0.0.tar.gz"
  version "3.0.0"
  sha256 "f301bc8a2f79a3fa461557cd50f4a6dbec0d8fe1ff55c59b68553ceb14247790"
   
  def install
    inreplace "bash/travisify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/travisify\""
    bin.install "bash/travisify"
    var.install "templates/travisify"
  end
end
