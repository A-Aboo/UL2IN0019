insert into Employe values (22334, 'Adam', 'Funk', 22334,'Paris', parsedatetime('01-12-1982', 'dd-MM-yyyy'));
insert into Employe values (45566, 'Rachid', 'Allaoui', 22334,'Lyon', parsedatetime('13-04-1986', 'dd-MM-yyyy'));
insert into Employe values (77889, 'Florent', 'Girac' , 45566,'Marseille', parsedatetime('04-11-1990', 'dd-MM-yyyy'));
insert into Employe values (90011, 'Mayla', 'Aoun', 22334, 'Lyon',parsedatetime('26-03-1987', 'dd-MM-yyyy')); 
insert into Employe values (22233, 'Christine', 'Lara', 45566,'Paris', parsedatetime('09-08-1982', 'dd-MM-yyyy'));
insert into Employe values (34445, 'Amel', 'Orlando', 22334,'Lyon', parsedatetime('14-02-1976', 'dd-MM-yyyy'));
insert into Employe values (55666, 'Mohsen', 'Charef', 45566,'Paris', parsedatetime('28-05-1991', 'dd-MM-yyyy'));
insert into Employe values (77788, 'Tim', 'Arabi', 22334,'Marseille', parsedatetime('08-06-1984', 'dd-MM-yyyy'));
insert into Employe values (89990, 'Fernando', 'Lopez', 45566,'Lyon', parsedatetime('05-10-1993', 'dd-MM-yyyy'));
insert into Employe values (11122, 'Ada','Tan Lee', 22334,'Marseille', parsedatetime('21-03-1994', 'dd-MM-yyyy'));	


insert into Projet values (12345, 'ADOOP', 22334, 'Paris', 120000);
insert into Projet values (75777, 'SKALA', 45566, 'Lyon', 180000);
insert into Projet values (89097, 'BAJA', 22334, 'Paris', 24000);


insert into grille_sal values ('Admin', 80000);
insert into grille_sal values ('Deve',45000);
insert into grille_sal values ('Tech',35000);

insert into Embauche values (77889, 12345, parsedatetime('01-03-2014', 'dd-MM-yyyy'),'Deve');
insert into Embauche values (90011, 12345, parsedatetime('01-05-2014', 'dd-MM-yyyy'),'Tech');
insert into Embauche values (22233, 75777, parsedatetime('01-03-2014', 'dd-MM-yyyy'),'Deve');
