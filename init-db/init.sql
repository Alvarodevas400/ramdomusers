-- init-db/init.sql

-- 1) Crear la tabla 'users' si no existe
CREATE TABLE IF NOT EXISTS public.users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE
);

-- 2) Insertar 100 nombres de usuario (ON CONFLICT DO NOTHING para evitar duplicados)
INSERT INTO public.users (username) VALUES
('alice'),    ('bob'),      ('charlie'),  ('david'),    ('eva'),
('frank'),    ('grace'),    ('hannah'),   ('ian'),      ('julia'),
('kevin'),    ('linda'),    ('michael'),  ('natalie'),  ('oscar'),
('paula'),    ('quentin'),  ('rachel'),   ('steve'),    ('tina'),
('ursula'),   ('victor'),   ('wanda'),    ('xavier'),   ('yvonne'),
('zach'),     ('amelia'),   ('brian'),    ('carla'),    ('daniel'),
('elena'),    ('felix'),    ('gemma'),    ('harry'),    ('isabel'),
('jack'),     ('karen'),    ('leo'),      ('maria'),    ('nathan'),
('olivia'),   ('peter'),    ('quinn'),    ('robin'),    ('sara'),
('thomas'),   ('ursel'),    ('victoria'), ('william'),  ('xena'),
('yuri'),     ('zoe'),      ('antonio'),  ('barbara'),  ('carlos'),
('diana'),    ('eduardo'),  ('fernanda'), ('george'),   ('helena'),
('igor'),     ('jamie'),    ('kimberly'), ('louis'),    ('monica'),
('nicolas'),  ('olga'),     ('pablo'),    ('rita'),     ('samuel'),
('theresa'),  ('ulysses'),  ('valerie'),  ('walter'),   ('ximena'),
('yandel'),   ('zoila'),    ('andrew'),   ('beth'),     ('cindy'),
('derek'),    ('eliza'),    ('francis'),  ('gabriela'), ('harold'),
('iris'),     ('joseph'),   ('kelsey'),   ('luca'),     ('margot'),
('nelson'),   ('ophelia'),  ('patrick'),  ('rebecca'),  ('silvia'),
('trevor'),   ('ursula2'),  ('victor2'),  ('wendy'),    ('xerox')
ON CONFLICT DO NOTHING;
