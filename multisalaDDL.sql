-- creiamo il database multisala
CREATE SCHEMA multisala;

-- selezioniamo il db multisala come default
use multisala;

-- creiamo le tabelle per la multisala

-- FILM

CREATE TABLE film(

	id_film int auto_increment,
    titolo varchar(30),
    durata int,
    genere varchar(30),
    anno_produz year,
    nazionalita varchar(30),
    
    primary key(id_film)

);

-- ATTORE

CREATE TABLE attore(

	id_attore int auto_increment,
    nome varchar(30),
    cognome varchar(30),
    data_nascita date,
    nazionalita varchar(30),
    n_oscar int,
    
    primary key(id_attore)

);

-- REGISTA

CREATE TABLE regista(

	id_regista int auto_increment,
    nome varchar(30),
    cognome varchar(30),
    data_nascita date,
    nazionalita varchar(30),
    n_oscar int,
    
    primary key(id_regista)

);

-- SALA

CREATE TABLE sala(

	id_sala int auto_increment,
    nome_sala varchar(30),
    tot_posti int,
    n_posti_liberi int,
    n_uscite_emergenza int,
    superficie int,
    
    primary key(id_sala)

);

-- PIVOT: ATTORE_FILM

CREATE TABLE attore_film(

	id_attore_film int auto_increment,
    FKattore int not null,
    FKfilm int,
    primary key(id_attore_film),
    
    foreign key(FKattore) references attore(id_attore),
	foreign key(FKfilm) references film(id_film)
);

-- PIVOT: REGISTA_FILM

CREATE TABLE regista_film(

	id_regista_film int auto_increment,
    FKregista int not null,
    FKfilm int,
    primary key(id_regista_film),
    
    foreign key(FKregista) references regista(id_regista),
	foreign key(FKfilm) references film(id_film)
);

-- PIVOT: PROIEZIONE

CREATE TABLE proiezione(

	id_proiezione int auto_increment,
    FKsala int,
    FKfilm int,
    h_inizio_riprese time,
    primary key(id_proiezione),
    
    foreign key(FKsala) references sala(id_sala),
	foreign key(FKfilm) references film(id_film)
);



