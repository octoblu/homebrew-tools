class Bashblu < Formula
  VERSION = "1.0.2"

  desc "Generate bash scripts"
  url "https://github.com/octoblu/unix-dev-tools-bashblu/archive/v#{VERSION}.tar.gz"
  sha256 "6df286639624a0b179983a966fc26effe455eb4ec8aa659b39bdb4d8dcab36d2"

  def install
    inreplace "bashblu.sh", 'local directory="$(script_directory)"', ""
    inreplace "bashblu.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "bashblu.sh", "bashblu"

    bin.install "bashblu"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/bashblu --version").strip
  end
end
