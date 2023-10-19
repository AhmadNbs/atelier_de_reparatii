drop table piesa_deviz;
drop table piesa;
drop table deviz;
drop table persoana;

--07.01

--a)
CREATE TABLE persoana
(id NUMBER(5), nume VARCHAR2(25), email VARCHAR2(40), adresa VARCHAR2(60));

--b)
CREATE TABLE deviz
(id_d NUMBER(5), data_introducere DATE, aparat VARCHAR2(25), simptome VARCHAR2(80), defect VARCHAR2(80), data_constatare DATE DEFAULT NULL, 
data_finalizare DATE DEFAULT NULL, durata NUMBER(4,2), manopera_ora NUMBER(6,2), total NUMBER (8,2), id_client NUMBER(5) , id_depanator NUMBER(5));

--c)
CREATE TABLE piesa
(id_p NUMBER(5), descriere VARCHAR2(50), fabricant VARCHAR2(30), cantitate_stoc NUMBER(5), pret_c NUMBER(8,2));

--d)
CREATE TABLE piesa_deviz
(id_d NUMBER(5), id_p NUMBER(5), cantitate NUMBER(5), pret_r NUMBER(8,2));

--e)
ALTER TABLE persoana
ADD CONSTRAINT c_per_id_pk PRIMARY KEY(id);

ALTER TABLE deviz
ADD CONSTRAINT c_dvz_idd_pk PRIMARY KEY(id_d);

ALTER TABLE piesa
ADD CONSTRAINT c_ps_idp_pk PRIMARY KEY(id_p);

ALTER TABLE piesa_deviz
ADD CONSTRAINT c_ps_dvz_idd_idp_pk PRIMARY KEY(id_d,id_p);

ALTER TABLE deviz
ADD CONSTRAINT c_dvz_id_clnt_fk FOREIGN KEY(id_client) REFERENCES persoana(id)
ADD CONSTRAINT c_dvz_id_dpnt_fk FOREIGN KEY(id_depanator) REFERENCES persoana(id);

ALTER TABLE piesa_deviz
ADD CONSTRAINT c_ps_dvz_idd_fk FOREIGN KEY(id_d) REFERENCES deviz(id_d);

ALTER TABLE piesa_deviz
ADD CONSTRAINT c_ps_dvz_idp_fk FOREIGN KEY(id_p) REFERENCES piesa(id_p);

ALTER TABLE piesa
ADD CONSTRAINT c_ps_dsc_uk UNIQUE(descriere)
ADD CONSTRAINT c_ps_fbc_uk UNIQUE(fabricant);

--f)
ALTER TABLE persoana
ADD(telefon VARCHAR2(15));

----------------------------------------------------------------------------------------------
--07.02

--a)
ALTER TABLE persoana
ADD CONSTRAINT c_email_per_ck CHECK(email LIKE '%@%' AND LENGTH(email)>=10);

--b)
ALTER TABLE deviz
ADD CONSTRAINT c_dvz_date_cK CHECK((data_finalizare IS NOT NULL AND data_constatare IS NOT NULL) OR (data_finalizare IS NULL AND data_constatare IS NULL));

-----------------------------------------------------------------------------------------------
--aici am adauagat datele pentru verificare ca query merge corect, niste coloane nu sunt numite cum e potrivit pentru verificarea rezultatului, iar tot codul si partea logica merge corect


INSERT INTO persoana
VALUES(1,'Ahmad','amd7676@gmail.com','cluj, zorilor 99 bloc 5, ap2', '0722334490');
INSERT INTO persoana
VALUES(2,'Andrei','andr7676@gmail.com','cluj, zorilor 40 bloc 5, ap2', '0733224490');
INSERT INTO persoana
VALUES(3,'Bogdan','bgd7676@gmail.com','cluj, marasti 19 bloc 3, ap5', '0722355490');
INSERT INTO persoana
VALUES(4,'Cosmin','csm7676@gmail.com','cluj, manasturi 20 bloc 1, ap4', '0722331190');
INSERT INTO persoana
VALUES(5,'Sergiu','srg7676@gmail.com','cluj, bulevardu 30 bloc 12, ap1', '0727734490');
INSERT INTO persoana
VALUES(11,'Paul','pl7676@gmail.com','cluj, dorabantilor 7 bloc 3, ap2', '0722344120');
INSERT INTO persoana
VALUES(17,'Dan','dan7676@gmail.com','cluj, central 3 bloc 1, ap1', '0788734430');




INSERT INTO deviz
VALUES(21,'04-Oct-2022','masina de spalat','piese pierdute','usa si sertarul sunt stricate','06-oct-2022','08-oct-2022',3,5,35,5,1);
INSERT INTO deviz
VALUES(32,'08-Oct-2022','frigider','nu functioniaza','motorul este stricat','11-oct-2022','14-oct-2022',2,5,50,4,1);
INSERT INTO deviz
VALUES(61,'08-Sep-2022','cuptor','nu incalzeste','firul nu trece electrica','11-sep-2022','14-sep-2022',3,8,40,3,2);
INSERT INTO deviz(id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator) 
VALUES(217, '15-sep-2021', 'Congelator', 'nu congeleaza', '', '20-sep-2021', '20-sep-2021', 2, 15, 30, 5, 2);
INSERT INTO deviz(id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator) 
VALUES(222, '28-JUL-2022', 'Congelator', 'nu congeleaza', '', '1-aug-2022', '5-aug-2022', NULL, NULL, NULL, 3, 17);
INSERT INTO deviz(id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator) 
VALUES(220, '15-aug-2022', 'Congelator', 'nu congeleaza', '', '18-aug-2022', '20-aug-2022', 4, 10, 40, 4, 2);
INSERT INTO deviz
VALUES(71,'04-MAY-2022','masina de spalat','usa stricata','usa','06-MAY-2022','08-oct-2022',5,5,45,5,17);
INSERT INTO deviz
VALUES(72,'08-MAY-2022','frigider','nu porneste','motor','11-oct-2022','14-MAY-2022',4,5,60,4,17);




INSERT INTO piesa
VALUES(101,'fir de cuptor', 'WHIRLPOOL', 13,15);
INSERT INTO piesa
VALUES(118,'motor pentru frigider', 'BOSC', 10,60);
INSERT INTO piesa
VALUES(122,'usa pentru masina de spalat', 'OMO', 50,15);
INSERT INTO piesa
VALUES(126,'sertar pentru masina de spalat', 'ARIEL', 32,8);
INSERT INTO piesa
VALUES(112,'usa pentru frigider', 'SAMSUNG', 6,30);
INSERT INTO piesa
VALUES(105,'usa pentru cuptor', 'LG', 2,20);
INSERT INTO piesa
VALUES(191,'picior pentru tabla', 'MOB',30,10);
INSERT INTO piesa
VALUES(194,'lemn pentru pat', 'KAT',150,5);



INSERT INTO piesa_deviz
VALUES(21,122,13,20);
INSERT INTO piesa_deviz
VALUES(21,126,11,5);
INSERT INTO piesa_deviz
VALUES(32,118,3,40);
INSERT INTO piesa_deviz
VALUES(61,101,8,16);
INSERT INTO piesa_deviz
VALUES(61,105,0,22);
INSERT INTO piesa_deviz
VALUES(32,112,1,24);




---------------------------------------------------------------------------------------------------
--07.03

--a)
SELECT *
FROM piesa p
WHERE (pret_c<50) AND (descriere LIKE '%r')
ORDER BY (SELECT pret_r FROM piesa_deviz pd WHERE p.id_p=pd.id_p) ASC;

--b)
SELECT *
FROM deviz
WHERE ((data_introducere >= '01-Oct-2022') AND (data_introducere < '01-Nov-2022'))
ORDER BY data_introducere ASC, defect DESC;


------------------------------------------------------------------------------------------------
--07.04

--a)
SELECT per.nume
FROM persoana per JOIN deviz dv ON(per.id=dv.id_client) JOIN piesa_deviz pdv ON(dv.id_d=pdv.id_d) JOIN piesa p ON (pdv.id_p=p.id_p)
WHERE pdv.pret_r>p.pret_c;

--b)
SELECT dvz1.id_d "id_d1", dvz2.id_d "id_d2", dvz1.aparat
FROM deviz dvz1 INNER JOIN deviz dvz2 ON(dvz1.aparat = dvz2.aparat AND dvz1.id_client = dvz2.id_client)
WHERE dvz1.id_d<dvz2.id_d;


--------------------------------------------------------------------------------------------------
--07.05

--a)
SELECT nume
FROM persoana
WHERE id IN(SELECT id_client FROM deviz WHERE id_d IN(SELECT id_d FROM piesa_deviz WHERE id_p IN(SELECT id_p FROM piesa WHERE pret_r<pret_c)));

--b)
SELECT *
FROM deviz d1
WHERE data_finalizare LIKE '%2022' AND total < ALL(SELECT total from deviz d2 WHERE d1.id_d != d2.id_d); 


---------------------------------------------------------------------------------------------------
--07.06

--a)
SELECT nume "Nume_Depanator", EXTRACT(month FROM data_finalizare) "Luna", COUNT(id_depanator) "Numarul de devize", SUM(total) "valoarea totala"
FROM persoana prs JOIN deviz dvz ON(prs.id=dvz.id_depanator)
WHERE data_finalizare LIKE '%2022'
GROUP BY nume, EXTRACT(month FROM data_finalizare);

--b)
SELECT descriere, fabricant, MAX(cantitate) "Cantitate Maxima"
FROM deviz dvz JOIN piesa_deviz psdvz ON(dvz.id_d = psdvz.id_d) JOIN piesa ps ON(psdvz.id_p=ps.id_p)
WHERE data_finalizare LIKE '%2022'
GROUP BY descriere, fabricant;


---------------------------------------------------------------------------------------------------
--07.07

--a)
INSERT INTO deviz(id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator) 
VALUES(123, '30-sep-2022', 'TV Samsung', 'imagine desincronizata', '', NULL, NULL, NULL, NULL, NULL, 11, 17);

--b)
DELETE FROM deviz
WHERE (data_finalizare < '01-jan-2022') AND (id_d NOT IN(SELECT id_d FROM piesa_deviz));

--c)
UPDATE deviz
SET manopera_ora = manopera_ora+manopera_ora*.1 , total = total+total*.1
WHERE data_finalizare BETWEEN '01-AUG-2022' AND '31-AUG-2022';


---------------------------------------------------------------------------------------------------
--07.08

--a)
CREATE OR REPLACE TRIGGER cantitate_stc_upd_trigg
BEFORE UPDATE OF cantitate ON piesa_deviz FOR EACH ROW
DECLARE
v_cnt_stc piesa.cantitate_stoc%TYPE;
BEGIN
SELECT cantitate_stoc INTO v_cnt_stc FROM piesa
WHERE piesa.id_p = :NEW.id_p;
v_cnt_stc := v_cnt_stc - :NEW.cantitate; 
IF v_cnt_stc<0 THEN
RAISE_APPLICATION_ERROR (-20001, 'Cantitatea stocului nu poate fie negativ');
ELSE
UPDATE piesa
SET cantitate_stoc =v_cnt_stc
WHERE piesa.id_p = :NEW.id_p;
END IF;
END;
/


--b)
create or replace TRIGGER dvz_data_fin_trigg
BEFORE INSERT ON piesa_deviz FOR EACH ROW
DECLARE
v_data_finalizare deviz.data_finalizare%TYPE;
BEGIN
SELECT data_finalizare INTO v_data_finalizare FROM deviz
WHERE deviz.id_d = :NEW.id_d;
IF v_data_finalizare IS NOT NULL THEN
RAISE_APPLICATION_ERROR(-20002,'Nu mai se poate adauga alta piesa');
END IF;
END;
/
--c)
create or replace TRIGGER vw_ps_dvz_123_trg
    INSTEAD OF INSERT ON PieseDeviz123 FOR EACH ROW
BEGIN

INSERT INTO Persoana(id, nume)
VALUES(:NEW.id_client, :NEW.nume);

INSERT INTO Persoana(id, nume)
VALUES(:NEW.id_depanator, :NEW.nume);

INSERT INTO deviz(id_d, data_introducere, aparat, simptome, defect, data_constatare, data_finalizare, durata, manopera_ora, total, id_client, id_depanator)
VALUES(123, :NEW.data_introducere, :NEW.aparat, :NEW.simptome, :NEW.defect, :NEW.data_constatare, :NEW.data_finalizare, :NEW.durata, :NEW.manopera_ora, :NEW.total, :NEW.id_client, :NEW.id_depanator);

INSERT INTO piesa_deviz(id_d, id_p, cantitate, pret_r)
VALUES(:NEW.id_d, :NEW.id_ip, :NEW.cantitate, :NEW.pret_r);

INSERT INTO piesa(id_p, descriere, fabricant, cantitate_stoc, pret_c)
VALUES(:NEW.id_p, :NEW.descriere, :NEW.fabricant, :NEW.cantitate_stoc, :NEW.pret_c);

END;
/