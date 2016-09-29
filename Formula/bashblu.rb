class Bashblu < Formula
  VERSION = "2.0.2"

  desc "Generate bash scripts"
  url "https://github.com/octoblu/unix-dev-tools-bashblu/archive/v#{VERSION}.tar.gz"
  sha256 "7a55510f87c2049a6608a88f8977bbf98e978fa15c6384299bfda95ea8b9ad48"

  def install
    inreplace "bashblu.sh", 'local directory="$(script_directory)"', ""
    inreplace "bashblu.sh", 'echo "unknown"', "echo '#{VERSION}'"

    move "bashblu.sh", "bashblu"

    bin.install "bashblu"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/bashblu --version").strip
  end
end
