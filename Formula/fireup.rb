class Fireup < Formula
  VERSION = "1.0.2"

  desc "Fireup a project"
  url "https://github.com/octoblu/unix-dev-tools-fireup/archive/v#{VERSION}.tar.gz"
  sha256 "d3310579edd770e68ad33125f1b562b6d12c9733ca3a3102e465c0ada3fe4e69"

  def install
    inreplace "fireup.sh", 'local directory="$(script_directory)"', ""
    inreplace "fireup.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "fireup.sh", "fireup"

    bin.install "fireup"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/fireup --version").strip
  end
end
