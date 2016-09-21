class WaitWaitTellMe < Formula
  VERSION = "1.0.0"

  desc "Make the genisys background a cinemagraph"
  url "https://github.com/octoblu/wait-wait-tell-me/archive/v#{VERSION}.tar.gz"
  sha256 "d05be018c7ec87d3daa2a11dd6dafa3f3ee1fb5807430b670d4e7827592a3fbb"
  depends_on 'jq'

  def install
    inreplace "wait-wait-tell-me.sh", 'local directory="$(script_directory)"', ""
    inreplace "wait-wait-tell-me.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    copy "wait-wait-tell-me.sh", "wait-wait-tell-me"

    bin.install "wait-wait-tell-me"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/wait-wait-tell-me --version").strip
  end
end
