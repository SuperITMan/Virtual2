--
-- Base de données :  'Virtual-Gallery'
--

CREATE DATABASE IF NOT EXISTS virtual_gallery
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
USE virtual_gallery;

-- --------------------------------------------------------

--
-- Structure de la table 'vg_users'
--

CREATE TABLE IF NOT EXISTS vg_users (
  id INTEGER AUTO_INCREMENT NOT NULL,
  username VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  passwd VARCHAR(255) NOT NULL,
  displayed_name VARCHAR(255) NOT NULL,
  birthday_date DATE NULL,
  UNIQUE (username),
  UNIQUE (email),
  PRIMARY KEY (id)
);

-- --------------------------------------------------------

--
-- Structure de la table `vg_users_meta`
--

CREATE TABLE IF NOT EXISTS vg_users_meta (
  id INTEGER AUTO_INCREMENT NOT NULL,
  user_id INTEGER NOT NULL,
  meta_key VARCHAR(255) NOT NULL,
  meta_value MEDIUMTEXT NOT NULL,
  UNIQUE (user_id, meta_key),
  FOREIGN KEY (user_id) REFERENCES vg_users(id),
  PRIMARY KEY (id)
);

-- --------------------------------------------------------

--
-- Structure de la table `vg_creations`
--

CREATE TABLE IF NOT EXISTS vg_creations (
  id INTEGER AUTO_INCREMENT NOT NULL,
  name VARCHAR(100) NOT NULL,
  short_description VARCHAR(254) NULL,
  long_description TEXT NULL,
  creation_type VARCHAR(254) NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES vg_users(id),
  PRIMARY KEY (id)
);

-- --------------------------------------------------------

--
-- Structure de la table `vg_creations_meta`
--

CREATE TABLE IF NOT EXISTS vg_creations_meta (
  id INTEGER AUTO_INCREMENT NOT NULL,
  creation_id INTEGER NOT NULL,
  meta_key VARCHAR(255) NOT NULL,
  meta_value MEDIUMTEXT NOT NULL,
  UNIQUE (creation_id, meta_key),
  FOREIGN KEY (creation_id) REFERENCES vg_creations(id),
  PRIMARY KEY (id)
);

-- --------------------------------------------------------

--
-- Structure de la table `vg_creations`
--

CREATE TABLE IF NOT EXISTS vg_categories (
  id INTEGER AUTO_INCREMENT NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- --------------------------------------------------------

--
-- Structure de la table `vg_categories_creations`
--

CREATE TABLE IF NOT EXISTS vg_categories_creations (
  id INTEGER AUTO_INCREMENT NOT NULL,
  creation_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  UNIQUE(creation_id, category_id),
  FOREIGN KEY (creation_id) REFERENCES vg_creations(id),
  FOREIGN KEY (category_id) REFERENCES vg_categories(id),
  PRIMARY KEY (id)
);

-- --------------------------------------------------------

--
-- Structure de la table `vg_categories_meta`
--

CREATE TABLE IF NOT EXISTS vg_categories_meta (
  id INTEGER AUTO_INCREMENT NOT NULL,
  category_id INTEGER NOT NULL,
  meta_key VARCHAR(255) NOT NULL,
  meta_value MEDIUMTEXT NOT NULL,
  UNIQUE (category_id, meta_key),
  FOREIGN KEY (category_id) REFERENCES vg_categories(id),
  PRIMARY KEY (id)
);

-- --------------------------------------------------------

--
-- Structure de la table `vg_options_meta`
--

CREATE TABLE IF NOT EXISTS vg_options_meta (
  id INTEGER AUTO_INCREMENT NOT NULL,
  meta_key VARCHAR(255) NOT NULL,
  meta_value MEDIUMTEXT NOT NULL,
  UNIQUE (meta_key),
  PRIMARY KEY (id)
);


-- --------------------------------------------------------

--
-- Structure de la table `vg_uploaded_files`
--

CREATE TABLE IF NOT EXISTS vg_uploaded_files (
  id integer AUTO_INCREMENT NOT NULL,
  file_name VARCHAR(254) NOT NULL,
  server_file_name VARCHAR(254) NOT NULL,
  mime VARCHAR(50) NOT NULL,
  upload_date DATETIME NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES vg_users(id),
  PRIMARY KEY (id)
);

-- --------------------------------------------------------

--
-- Structure de la table `vg_uploaded_files_meta`
--

CREATE TABLE IF NOT EXISTS vg_uploaded_files_meta (
  id integer AUTO_INCREMENT NOT NULL,
  file_id INTEGER NOT NULL,
  meta_key VARCHAR(255) NOT NULL,
  meta_value MEDIUMTEXT NOT NULL,
  UNIQUE (file_id, meta_key),
  FOREIGN KEY (file_id) REFERENCES vg_uploaded_files(id),
  PRIMARY KEY (id)
)