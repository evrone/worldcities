# PLEASE NOTE, THIS PROJECT IS NO LONGER BEING MAINTAINED
# World cities database

Cleaned-up and Rails adapted version of MaxMind DB.
Removed obsolete countries (Zair, etc), add regions & countries migration.

<a href="https://evrone.com/?utm_source=github.com">
  <img src="https://evrone.com/logo/evrone-sponsored-logo.png"
       alt="Sponsored by Evrone" width="231">
</a>

## Getting Started
### Usage

1. Copy migrations and run them.
2. Copy fixtures and seed with seed_fu or other gems.
3. Modify the rake task to point to gzipped version of locations.csv.gz, for example upload to S3.
4. Run rake task with rake db:seed:locations.

## Contributing

Please read [Code of Conduct](CODE-OF-CONDUCT.md) and [Contributing Guidelines](CONTRIBUTING.md) for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, 
see the [tags on this repository](https://github.com/evrone/worldcities/tags). 

## Changelog

The changelog is [here](CHANGELOG.md).

## Authors

* [Valentin Vasilyev](https://github.com/Valve) - *Initial work*

See also the list of [contributors](https://github.com/evrone/worldcities/contributors) who participated in this project.

## License

This project is licensed under the [MIT License](LICENSE).
