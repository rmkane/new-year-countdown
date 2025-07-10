defmodule NewYearCountdown.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      # Core project info
      app: :new_year_countdown,
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,

      # Metadata
      name: "New Year Countdown",
      source_url: "https://github.com/rmkane/new-year-countdown",
      homepage_url: "https://github.com/rmkane/new-year-countdown",
      description: "A terminal-based New Year countdown in Elixir.",
      package: package(),

      # Dependencies
      deps: deps()
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Ryan Kane"],
      links: %{
        "GitHub" => "https://github.com/rmkane/new-year-countdown"
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {App, [@version]},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:timex, "~> 3.7"},
      {:tzdata, "~> 1.1"}
    ]
  end
end
