# Bag of Holding

Inventory management service.

## Requirements

- go 1.26+
- sqlc @latest
- goose @latest
- psql 15+

## Getting Started

### Install SQLC

```bash
go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
```

### Install Goose

```bash
go install github.com/pressly/goose/v3/cmd/goose@latest
```

### Install Postgres(v15+)

Mac OS:

```bash
brew install postgresql@15
```

Linux/WSL (Debain):

```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
```

Linux Only, set postgres password:

```bash
sudo passwd postgres
```

Start the postgres server in the background

- Mac `brew services start postgresql@15`
- Linux `sudo service postgresql start`
