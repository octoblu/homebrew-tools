class Bashblu < Formula
  VERSION = "3.0.0"

  desc "Generate bash scripts"
  url "https://github.com/octoblu/unix-dev-tools-bashblu/archive/v#{VERSION}.tar.gz"
  sha256 "a29e4e17a28e3aa3cc9984c93fc2dfc91d1b7e69426910b964c6f412173dafd4"

  def install
    inreplace "bashblu.sh", 'local directory="$(script_directory)"', ""
    inreplace "bashblu.sh", 'echo "unknown-version"', "echo '#{VERSION}'"

    move "bashblu.sh", "bashblu"

    bin.install "bashblu"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/bashblu --version").strip
  end
end
