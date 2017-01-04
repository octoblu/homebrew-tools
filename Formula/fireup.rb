class Fireup < Formula
  VERSION = "2.0.0"

  desc "Fireup a project"
  url "https://github.com/octoblu/unix-dev-tools-fireup/archive/v#{VERSION}.tar.gz"
  sha256 "cee62cabe15a055379e6bf1c7a546f12e5fc9c40ea05ab97379d78a5923425cb"
  depends_on 'hub'

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
