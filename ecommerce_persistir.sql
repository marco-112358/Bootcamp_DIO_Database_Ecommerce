INSERT INTO states (uf, name_uf) 
VALUES
('AC','Acre'),
('AL','Alagoas'),
('AM','Amazonas'),
('AP','Amapá'),
('BA','Bahia'),
('CE','Ceará'),
('DF','Distrito Federal'),
('ES','Espírito Santo'),
('GO','Goiás'),
('MA','Maranhão'),
('MG','Minas Gerais'),
('MS','Mato Grosso do Sul'),
('MT','Mato Grosso'),
('PA','Pará'),
('PB','Paraíba'),
('PE','Pernambuco'),
('PI','Piauí'),
('PR','Paraná'),
('RJ','Rio de Janeiro'),
('RN','Rio Grande do Norte'),
('RO','Rondônia'),
('RR','Roraima'),
('RS','Rio Grande do Sul'),
('SC','Santa Catarina'),
('SE','Sergipe'),
('SP','São Paulo'),
('TO','Tocantins');

INSERT INTO type_payments (description_payment) 
VALUES
('Cartão de crédito'),
('Cartão de débito'),
('Boleto bancário'),
('PIX');

INSERT INTO sellers (fname_seller, lname_seller, email_seller, phone_seller) 
VALUES
('Luiz','Toledo','ltoledo@ig.com.br','11958642541'),
('Beatriz','Souza','biasouza@gmail.com','11952874195'),
('Ana','Silva','anasilva@hotmail.com','21988523974'),
('Carlos','Cordeiro','cordeiro@hotmail.com','51922569147'),
('Geraldo','Lima','geraldol@gmail.com','41988541299');

INSERT INTO products (description_prod,unit,inventory_date,inventory_qtd,price_unit,current_qtd,min_qtd,discontinued) 
VALUES
('Mouse Logitech','UN','2022-10-10',35,60.00,35,10,0),
('Teclado padrão com fio USB Logitech K120', 'UN', '2022-10-30', 35, 76.77, 40, 10, 0),
('Monitor Samsung LED23.5 Wid Curvo,FullHD,HDMI/VGA', 'UN', '2022-10-10', 10, 799.99, 9, 5, 0),
('Notebook Lenovo ideapad Gaming 3i i5-10300H 8GB','UN','2022-09-30',5,4654.05,4,1,0),
('Impressora multifuncinal HP DeskJet 2774 Wi-Fi','UN','2022-12-30',3,344.26,3,1,0),
('Suporte para Notebook, Preto','UN','2022-09-15',7,39.99,5,2,0);

INSERT INTO providers (cnpj, rsocial, contact_name, function_name, email, phone, address, neighborhood, city, cep, states_uf) 
VALUES
('54265845632589','3 irmãos','João Conrado','Vendedor','jconrado@hotmail.com','21998780987','Rua América, 76','Bairro das Andorinhas','São Paulo','85714269', 'SP'),
('89658456321223','Loja Maricota','Maria do Carmo','Vendedor','mcarmo@hotmail.com','31989780231','Rua dos Tupis, 322 - Loja L11/L13','Centro','Belo Horizonte','30190060', 'MG'),
('59965845632007','L4 Comercial Ltda','José Geraldo','Vendedor','zegeraldo@gmail.com','11940858100','R. Maria Joaquina, 87','Brás','São Paulo','03016010', 'SP'),
('54165845632780','Planar Eletrônica Ltda','Marcus Azevedo','Vendedor','mazevedo@gmail.com','21922638308','Av. Mal. Floriano, 139','Centro','Rio de Janeiro','20080005', 'RJ'),
('94265845632580','Casas Assis','Juliana Brandão','Vendedor','julianabrandao@gmail.com','31999780978','Rua das Canárias, 125','Santo Antônio','Belo Horizonte','90122553', 'MG');

INSERT INTO customers_pf (cpf,fname,lname,sex,bdate,email,phone,address,neighborhood,city,cep,states_uf) 
VALUES
('57489365584','Simone','Cintra','F','1978-09-08','simonecintra@hotmail.com','21985896411','Rua Marte, 166','Santo Ignácio','São Paulo','85714269','SP'),
('21568332411','Carla','Oliveira','F','1989-06-12','carlaoliv@gmail.com','31985896411','Rua Vênus, 99','Nova York','Belo Horizonte','55698447','MG'),
('88742695583','Anderson','Coelho','M','1968-09-11','andersonc@hotmail.com','31955231488','Rua Nove, 77','Santo Agostinho','Belo Horizonte','55693324','MG'),
('66577423984','Maria','Lima','F','1960-10-08','marialima@gmail.com','11955214777','Rua Lins, 600','Brás','Santo Amaro','55789635','SP'),
('11458962279','Leonardo','Santos','M','1988-01-10','lsantos@hotmail.com','21985896411','Rua Genova, 10','Asa Norte','Rio de Janeiro','55986632','RJ'),
('99523687445','Marina','Costa','F','1958-03-02','marinacosta@gmail.com','31955746922','Rua Paris, 74','Bairro Santo Antônio','Belo Horizonte','31030220','MG');

INSERT INTO customers_pj (cnpj,rsocial,contact_name,function_name,email,phone,address,neighborhood,city,cep,states_uf) 
VALUES
('12584711256358','R444 Ltda','José Geraldo','Gerente Geral','zegeraldo@hotmail.com','11988545521','Rua da Travessa, 21','Limeiroeiro','São Paulo','22145877','SP'),
('88874522145632','Tech Mais Ltda','Luiza Souza','Compradora','Luizasouza@gmail.com','21985587741','Rua 2, 44','Abre Campo','São Gonçalo','55689911','RJ'),
('66998744122587','Três marias S.A.','Marcio Sá','Comprador','marciosa@gmail.com','33955478112','Av. Andradas, 1244','Centro','Ubá','27784471','MG'),
('99874475512475','Eletro Biz','Jussara Gomes','Gerente de compras','jussarag@hotmail.com','31955478112','Av. 1 de maio, 10','Centro','Belo Horizonte','33524417','MG');

INSERT INTO products_entry (providers_idproviders,nf,date_entry) 
VALUES
(3,'001259965847','2022-09-18'),
(2,'225699884122','2021-10-01'),
(2,'000000025669','2022-01-05'),
(3,'000005255897','2018-02-03'),
(1,'0012533','2022-01-02'),
(1,'00001235','2020-03-03'),
(1,'000989','2021-05-09'),
(2,'0000055587','2019-10-11'),
(4,'122356','2019-04-05'),
(5,'0000002554','2018-05-08');

INSERT INTO products_entry_det (products_entry_idproducts_entry,products_idproducts,products_entry_qtd,products_entry_price) 
VALUES
(10,5,2,333.50),
(1,3,5,780.25),
(1,3,8,777.00),
(2,2,6,74.00),
(10,5,3,328.78),
(2,2,5,76.55);

INSERT INTO orders (order_date,type_payments_idtype_payments,sellers_idsellers,canceled,status) 
VALUES
('2022-09-01',3,1,0,'delivered'),
('2022-09-01',2,1,0,'delivered'),
('2022-09-07',1,1,0,'delivered'),
('2022-09-10',2,1,0,'in progress'),
('2022-09-18',1,1,0,'in progress');

INSERT INTO orders_details_pf (orders_idorders,customers_pf_idcustomers_pf,products_idproducts,orders_details_pf_qtd) 
VALUES
(2,3,1,1),
(2,3,4,1),
(4,1,4,1),
(1,6,6,1);

INSERT INTO orders_details_pj (orders_idorders,customers_pj_idcustomers_pj,products_idproducts,orders_details_pj_qtd) 
VALUES
(3,1,6,1),
(3,1,5,2),
(5,4,3,1),
(5,4,1,3),
(5,4,2,3);

































