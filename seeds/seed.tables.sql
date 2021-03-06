BEGIN;

TRUNCATE
  "word",
  "language",
  "user";

INSERT INTO "user" ("id", "username", "name", "password")
VALUES
  (
    1,
    'admin',
    'Dunder Mifflin Admin',
    -- password = "pass"
    '$2a$10$fCWkaGbt7ZErxaxclioLteLUgg4Q3Rp09WW0s/wSLxDKYsaGYUpjG'
  );

INSERT INTO "language" ("id", "name", "user_id")
VALUES
  (1, 'German', 1);

INSERT INTO "word" ("id", "language_id", "original", "translation", "next")
VALUES

  (1, 1, 'trainieren', 'practice', 2),
  (2, 1, 'hallo', 'hello', 3),
  (3, 1, 'haus', 'house', 4),
  (4, 1, 'entwickler', 'developer', 5),
  (5, 1, 'essen', 'food', 6),
  (6, 1, 'tolle', 'amazing', 7),
  (7, 1, 'hund', 'dog', 8),
  (8, 1, 'gut', 'good', 9),
  (9, 1, 'buch', 'book', 10),
  (10, 1, 'katze', 'cat', null);

UPDATE "language" SET head = 1 WHERE id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT setval('word_id_seq', (SELECT MAX(id) from "word"));
SELECT setval('language_id_seq', (SELECT MAX(id) from "language"));
SELECT setval('user_id_seq', (SELECT MAX(id) from "user"));

COMMIT;
