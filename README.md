# New Year Countdown

A terminal-based New Year countdown written in [Elixir](https://elixir-lang.org/).

It displays the time remaining until the next January 1st in your local time zone.

## Getting Started

### Prerequisites

- [Elixir](https://elixir-lang.org/install.html) 1.12 or later

### Running the App

Clone the repository and run:

```bash
make run
```

This will compile the code and display the countdown.

### Example Output

```
New Year Countdown | Version: 1.0

The next New Year (America/New_York) will occur in: 175 Days, 4 Hours, 7 Minutes, 22 Seconds
```

## Project Structure

- `lib/app.ex` — Application entry point (`App.start/2`)
- `lib/date/duration.ex` — Duration logic for calculating time until the next new year
- `lib/date/formatter.ex` — Formats a duration into a human-readable string
- `lib/math/utils.ex` — Utility math functions (e.g. integer division with remainder)

## Running Tests

Run all tests using:

```bash
mix test
```

Tests are written using [ExUnit](https://hexdocs.pm/ex_unit/ExUnit.html) and include coverage for:

- Duration conversion (`Date.Duration`)
- Human-readable formatting (`Date.Formatter`)
- Integer division with remainder (`Math.Utils`)

## Development Notes

- Uses [`Timex`](https://hexdocs.pm/timex/Timex.html) to detect the system time zone
- Modularized for readability and reuse
- All durations are calculated using timezone-aware `DateTime` values

## License

MIT
