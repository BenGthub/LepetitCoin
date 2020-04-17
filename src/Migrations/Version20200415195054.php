<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200415195054 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE album CHANGE photo2 photo2 VARCHAR(255) DEFAULT NULL, CHANGE photo3 photo3 VARCHAR(255) DEFAULT NULL, CHANGE photo4 photo4 VARCHAR(255) DEFAULT NULL, CHANGE photo5 photo5 VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE commentaire CHANGE annonce_id annonce_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE membre ADD pseudo VARCHAR(20) DEFAULT NULL, ADD civilite VARCHAR(1) NOT NULL, ADD prenom VARCHAR(20) NOT NULL, ADD nom VARCHAR(20) NOT NULL, ADD telephone VARCHAR(20) NOT NULL, ADD date_enregistrement DATETIME NOT NULL, CHANGE roles roles JSON NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE album CHANGE photo2 photo2 VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE photo3 photo3 VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE photo4 photo4 VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE photo5 photo5 VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE commentaire CHANGE annonce_id annonce_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE membre DROP pseudo, DROP civilite, DROP prenom, DROP nom, DROP telephone, DROP date_enregistrement, CHANGE roles roles LONGTEXT CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_bin`');
    }
}
