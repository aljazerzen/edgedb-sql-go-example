module default {
    type Person {
        required first_name: str;
        last_name: str;
    }

    type Genre {
        required name: str;
    }

    type Content {
        required title: str;
        genre: Genre;

        index fts::index on (
            fts::with_options(.title, language := fts::Language.eng)
        );
    }

    type Movie extending Content {
        release_year: int64;
        multi actors: Person {
            role: str;
        };
        director: Person {
            bar: str;
        };
    }

    type Book extending Content {
        required pages: int16;        
        multi chapters: str;
    }

    type novel extending Book {
        foo: str;

        index fts::index on ((
            fts::with_options(.title, language := fts::Language.eng),
            fts::with_options(.foo, language := fts::Language.eng),
        ));
    }

    module nested {
        type Hello {
            property hello -> str;
        };

        module deep {
            type Rolling {
                property rolling -> str;
            };
        };
    };

    abstract type X {
        name: str;
    }

    type Y extending X {
        age: int16;
    }
};
