class Testify < Formula
  desc "Setup travis and mocha to run tests"
  url "https://github.com/octoblu/node-dev-tools/archive/v2.0.0.tar.gz"
  version "2.0.0"
  sha256 "2a17d2abd00c3f83d3979c53404ba2a49de5af2da477f80991b43c3135e24bd7"

  depends_on "octoblu/tools/travisify"

  def install
    inreplace "bash/testify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/testify\""
    bin.install "bash/testify"
    var.install "templates/testify"
  end
end
