CREATE MIGRATION m1kupjtd35dyjk6g4vdmdravr4uo5tlyaiolf7wiizeot6nnlfsema
    ONTO initial
{
  CREATE MODULE default::nested IF NOT EXISTS;
  CREATE MODULE default::nested::deep IF NOT EXISTS;
  CREATE TYPE default::Genre {
      CREATE REQUIRED PROPERTY name: std::str;
  };
  CREATE TYPE default::Content {
      CREATE LINK genre: default::Genre;
      CREATE REQUIRED PROPERTY title: std::str;
      CREATE INDEX fts::index ON (fts::with_options(.title, language := fts::Language.eng));
  };
  CREATE TYPE default::Book EXTENDING default::Content {
      CREATE MULTI PROPERTY chapters: std::str;
      CREATE REQUIRED PROPERTY pages: std::int16;
  };
  CREATE TYPE default::novel EXTENDING default::Book {
      CREATE PROPERTY foo: std::str;
      CREATE INDEX fts::index ON ((fts::with_options(.title, language := fts::Language.eng), fts::with_options(.foo, language := fts::Language.eng)));
  };
  CREATE TYPE default::Person {
      CREATE REQUIRED PROPERTY first_name: std::str;
      CREATE PROPERTY last_name: std::str;
  };
  CREATE TYPE default::Movie EXTENDING default::Content {
      CREATE MULTI LINK actors: default::Person {
          CREATE PROPERTY role: std::str;
      };
      CREATE LINK director: default::Person {
          CREATE PROPERTY bar: std::str;
      };
      CREATE PROPERTY release_year: std::int64;
  };
  CREATE ABSTRACT TYPE default::X {
      CREATE PROPERTY name: std::str;
  };
  CREATE TYPE default::Y EXTENDING default::X {
      CREATE PROPERTY age: std::int16;
  };
  CREATE TYPE default::nested::Hello {
      CREATE PROPERTY hello: std::str;
  };
  CREATE TYPE default::nested::deep::Rolling {
      CREATE PROPERTY rolling: std::str;
  };
};
