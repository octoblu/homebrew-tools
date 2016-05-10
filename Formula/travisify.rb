class Travisify < Formula
  desc "Create a travis yaml and enable travis"
  url "https://github.com/octoblu/node-dev-tools/archive/v2.0.0.tar.gz"
  version "2.0.0"
  sha256 "2a17d2abd00c3f83d3979c53404ba2a49de5af2da477f80991b43c3135e24bd7"

  def install
    inreplace "bash/travisify", 'TEMPLATES_DIR="$(get_templates_dir)"', "TEMPLATES_DIR=\"#{var}/travisify\""
    bin.install "bash/travisify"
    var.install "templates/travisify"
  end
end
