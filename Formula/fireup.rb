class Fireup < Formula
  VERSION = "1.0.3"

  desc "Fireup a project"
  url "https://github.com/octoblu/unix-dev-tools-fireup/archive/v#{VERSION}.tar.gz"
  sha256 "72473340d48456a59a5069447b45e0a3924dd6523ca9849013b3efa23e74f376"

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
