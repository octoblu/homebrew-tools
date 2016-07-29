class Fireup < Formula
  VERSION = "1.1.0"

  desc "Fireup a project"
  url "https://github.com/octoblu/unix-dev-tools-fireup/archive/v#{VERSION}.tar.gz"
  sha256 "8bff64d6dcb88d4e84bc9b4d543d1b7735531f9e857e2ebd9c174aa6e0a704c9"
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
