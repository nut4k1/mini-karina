# Run a first generation (in Docker)

create fixtures from sources
```sh
rake galactic_cruise:generate_fixtures:all -m
```

generate random setup
```sh
rake galactic_cruise:test:marketing_board
```

image will be available at /tmp folder
