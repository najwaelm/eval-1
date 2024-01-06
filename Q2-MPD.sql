-- MPD en SQLite
-- creation des tables puis ajout des relations

CREATE TABLE medecin(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR (100) NOT NULL 
);


CREATE TABLE malade(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR (100) NOT NULL 
);

CREATE TABLE symptome(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR (255) NOT NULL 
);

CREATE TABLE maladie(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR (255) NOT NULL 
);

-- relations one to many
CREATE TABLE consultation(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATE  NOT NULL DEFAULT CURRENT_DATE,
    prix SMALLINT NOT NULL,
    id_medecin INTEGER,
    id_malade INTEGER,
    FOREIGN KEY (id_medecin) REFERENCES medecin(id),
    FOREIGN KEY (id_malade) REFERENCES malade(id)
);


-- relations many to many
CREATE TABLE detection(
    id_consultation INTEGER,
    id_symptome INTEGER,
    FOREIGN KEY (id_consultation) REFERENCES consultation(id),
    FOREIGN KEY (id_symptome) REFERENCES symptome(id)
);

CREATE TABLE diagnostique(
    id_consultation INTEGER,
    id_maladie INTEGER,
    FOREIGN KEY (id_consultation) REFERENCES consultation(id),
    FOREIGN KEY (id_maladie) REFERENCES maladie(id)
);

CREATE TABLE association(
    id_symptome INTEGER,
    id_maladie INTEGER,
    FOREIGN KEY (id_symptome) REFERENCES symptome(id),
    FOREIGN KEY (id_maladie) REFERENCES maladie(id)
);


