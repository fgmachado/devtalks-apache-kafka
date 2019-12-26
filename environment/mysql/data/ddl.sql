create schema if not exists devtalks;

create table if not exists devtalks.cliente (
    id int not null auto_increment,
    nome varchar(100) not null,
    email varchar(150) not null,
    data_modificacao datetime default current_timestamp on update current_timestamp,
    constraint pk_cliente primary key(id),
    constraint uk_email unique(email)
);

create table if not exists devtalks.pedido (
    id int not null auto_increment,
    cliente_id int not null,
    data_modificacao datetime default current_timestamp on update current_timestamp,
    constraint pk_pedido primary key(id),
    constraint fk_cliente_pedido foreign key(cliente_id) 
        references devtalks.cliente(id)
);

create table if not exists devtalks.pedido_item (
    id int not null auto_increment,
    pedido_id int not null,
    quantidade int not null,
    descricao varchar(200) not null,
    data_modificacao datetime default current_timestamp on update current_timestamp,
    constraint pk_pedido primary key(id),
    constraint ck_quantidade check(quantidade > 0),
    constraint fk_pedido_pedido_item foreign key(pedido_id)
        references devtalks.pedido(id)
);