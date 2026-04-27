/*pour supprimer le schéma de la base*/
drop  all objects;

/*domaines*/
/* Le numéro de sécurité sociale possède exactement 5 chiffres.*/ 
create domain dnumss as numeric(5) check(length(value)=5);
/* Les attributs textuels (NomE, PrenomE, NomProj, Profil) ne dépassent pas 20 caractères (ils peuvent en avoir moins).*/
create domain dchaines as varchar(20);
/* La ville d’un employé (VilleE) ou d’un projet (VilleP) se limite à 'Paris', 'Lyon' et 'Marseille' et sa longueur ne dépasse pas 9 caractères.*/
create domain dvilles as varchar(9) check(lower(value) in ('paris','lyon','marseille')) ;
/*Le numéro d’un projet varie entre 5 et 7 chiffres.*/
create domain dnumproj as numeric(7) check (length(value)>=5);
/*le check définit la borne min. La borne max est assurée par numeric(7)*/
/*Le salaire peut avoir deux chiffres après la virgule et ne dépasse pas 90 000.*/ 
create domain dsal as numeric(7,2) check (value <=90000);
/*Budget sur 6 chiffres*/
create domain dbudget as numeric(6);
/*Aucun employé ne peut avoir plus de 70 ans au moment où il est enregistré dans la table Employé.*/
create domain ddatenaiss as date check (datediff(year,value, current_date)<=70) ;

/*EMPLOYE (NumSS, NomE, PrenomE, NumChef*, VilleE, DateNaiss)*/ 
create table Employe(
NumSS dnumss,
NomE dchaines,
PrenomE dchaines,
NumChef dnumss,
VilleE dvilles,
DateNaiss ddatenaiss,
/*contraintes de cle et referentielles*/
constraint pk_emp primary key (NumSS),
constraint fk_chef foreign key (numchef) references Employe on delete cascade, 
constraint key_emp unique(NomE, PrenomE) );

/*PROJET(NumProj, NomProj, RespProj*, VilleP, Budget)*/ 
create table Projet(
NumProj dnumproj,
NomProj dchaines,
RespProj dnumss,
VilleP dvilles,
Budget dbudget,
/*contraintes de cle et referentielles*/
constraint pk_proj primary key(numproj),
constraint fk_resp foreign key (RespProj) references Employe on delete cascade
);

/*GRILLE_SAL (Profil, salaire)*/ 
create table Grille_sal(
profil dchaines,
salaire dsal,
/*contraintes de cle et referentielles*/ 
constraint pk_sal primary key (profil) );

/*EMBAUCHE (NumSS*, NumProj*, DateEmb, Profil*)*/ 
create table Embauche(
NumSS dnumss,
NumProj dnumproj,
DateEmb date,
Profil dchaines not null,
/*contraintes de cle et referentielles*/
constraint pk_emb primary key (NumSS, NumProj),
constraint fk_emb_emp foreign key (NumSS) references Employe on delete cascade, 
constraint fk_emb_proj foreign key (NumProj) references Projet on delete cascade, 
constraint fk_emb_sal foreign key (Profil) references Grille_sal on delete cascade
);

alter table PROJET add constraint ct_ville_resprojet check (respproj in (select numss from employe where villee = villep)) ;