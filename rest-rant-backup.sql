PGDMP         .                {           rest_rant_auth    15.1    15.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17709    rest_rant_auth    DATABASE     �   CREATE DATABASE rest_rant_auth WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE rest_rant_auth;
                postgres    false            W           1247    17741    enum_users_role    TYPE     L   CREATE TYPE public.enum_users_role AS ENUM (
    'reviewer',
    'admin'
);
 "   DROP TYPE public.enum_users_role;
       public          postgres    false            �            1259    17710    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false            �            1259    17734    comments    TABLE     '  CREATE TABLE public.comments (
    comment_id integer NOT NULL,
    place_id smallint,
    stars double precision,
    content character varying(255),
    rant boolean,
    author_id smallint,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    17733    comments_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.comments_comment_id_seq;
       public          postgres    false    220                       0    0    comments_comment_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.comments_comment_id_seq OWNED BY public.comments.comment_id;
          public          postgres    false    219            �            1259    17716    places    TABLE     `  CREATE TABLE public.places (
    place_id integer NOT NULL,
    name character varying(255),
    city character varying(255),
    state character varying(255),
    cuisines character varying(255),
    pic character varying(255),
    founded integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.places;
       public         heap    postgres    false            �            1259    17715    places_place_id_seq    SEQUENCE     �   CREATE SEQUENCE public.places_place_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.places_place_id_seq;
       public          postgres    false    216                       0    0    places_place_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.places_place_id_seq OWNED BY public.places.place_id;
          public          postgres    false    215            �            1259    17725    users    TABLE     �  CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    password_digest character varying(255),
    role public.enum_users_role DEFAULT 'reviewer'::public.enum_users_role
);
    DROP TABLE public.users;
       public         heap    postgres    false    855    855            �            1259    17724    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    218                       0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    217            y           2604    17737    comments comment_id    DEFAULT     z   ALTER TABLE ONLY public.comments ALTER COLUMN comment_id SET DEFAULT nextval('public.comments_comment_id_seq'::regclass);
 B   ALTER TABLE public.comments ALTER COLUMN comment_id DROP DEFAULT;
       public          postgres    false    219    220    220            v           2604    17719    places place_id    DEFAULT     r   ALTER TABLE ONLY public.places ALTER COLUMN place_id SET DEFAULT nextval('public.places_place_id_seq'::regclass);
 >   ALTER TABLE public.places ALTER COLUMN place_id DROP DEFAULT;
       public          postgres    false    215    216    216            w           2604    17728    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    217    218    218                      0    17710    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    214   !                 0    17734    comments 
   TABLE DATA           q   COPY public.comments (comment_id, place_id, stars, content, rant, author_id, created_at, updated_at) FROM stdin;
    public          postgres    false    220   �!                 0    17716    places 
   TABLE DATA           m   COPY public.places (place_id, name, city, state, cuisines, pic, founded, created_at, updated_at) FROM stdin;
    public          postgres    false    216   T"                 0    17725    users 
   TABLE DATA           u   COPY public.users (user_id, first_name, last_name, email, created_at, updated_at, password_digest, role) FROM stdin;
    public          postgres    false    218   #                   0    0    comments_comment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.comments_comment_id_seq', 15, true);
          public          postgres    false    219            !           0    0    places_place_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.places_place_id_seq', 2, true);
          public          postgres    false    215            "           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 6, true);
          public          postgres    false    217            {           2606    17714     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    214            �           2606    17739    comments comments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    220            }           2606    17723    places places_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (place_id);
 <   ALTER TABLE ONLY public.places DROP CONSTRAINT places_pkey;
       public            postgres    false    216                       2606    17732    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218               n   x�U�K� D��Ӗ��.ntcTh���O��t�^'C@]MK�V�,~��>H3E�h���?ڡc�А�I�������1��z��)ǏS+�z���sB�(�=3/         �   x�}ѽ�0���)��Ds�/���Gpt1%��[#
J5���ܯw-0h؅~l���]W�.�L�����P��SeF�O��X�	����R��^��w8�ڰ�Ӎ`��l,IE
\D�:rFZ�]Q�Km����M�,�v}�7iJ��SC�	�}�Xյa�nnɅ�^�����C[Ex��x�
ao         �   x����
�@��ק��:N	��ڴ(
�hsӫ35��7��/���l���I`�;C�+�2�8�}	�5	7�,y0"}Ǯ�șn���kn��:�Wjy��Xsu(tr<D羅$�r�JOQiTI�d�,/Re)��;	4,���6\���0lL��>�<�Q�0O�9]����[�	`E��g�_��Q/��U�         U  x�}�Ks�0���W�pk
᝕|�@�Ei�M���@l����ꔙ���ꜹgq�9W�r�p
hI�]J۵��$#�%���4k6����I�/Zz@�"�G*$8�H�sMN� ;ь$i��^w$ca݄�a]u�GM5�I��d��[�)�t��������͟�`�Ue|�^,�){�_:x� `ƈ(A~���k���BX���C��n��j8�f��F�x�/#h���J�r����\�IL���!	D	�S�Y �ʒ\2�+ �\���￘�baņ�y��}Tc�O�m?�%��f|F��ϓ��ګ�T�p��M?����5��į��P��o/e�V     