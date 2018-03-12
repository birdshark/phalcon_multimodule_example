<?php 

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class RoleAdminMigration_100
 */
class RoleAdminMigration_100 extends Migration
{
    /**
     * Define the table structure
     *
     * @return void
     */
    public function morph()
    {
        $this->morphTable('role_admin', [
                'columns' => [
                    new Column(
                        'admin_id',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'unsigned' => true,
                            'notNull' => true,
                            'size' => 10,
                            'first' => true
                        ]
                    ),
                    new Column(
                        'role_id',
                        [
                            'type' => Column::TYPE_INTEGER,
                            'unsigned' => true,
                            'notNull' => true,
                            'size' => 10,
                            'after' => 'admin_id'
                        ]
                    )
                ],
                'indexes' => [
                    new Index('PRIMARY', ['admin_id', 'role_id'], 'PRIMARY'),
                    new Index('role_admin_role_id_foreign', ['role_id'], null)
                ],
                'references' => [
                    new Reference(
                        'role_admin_admin_id_foreign',
                        [
                            'referencedTable' => 'admins',
                            'referencedSchema' => 'test',
                            'columns' => ['admin_id'],
                            'referencedColumns' => ['id'],
                            'onUpdate' => 'CASCADE',
                            'onDelete' => 'CASCADE'
                        ]
                    ),
                    new Reference(
                        'role_admin_role_id_foreign',
                        [
                            'referencedTable' => 'roles',
                            'referencedSchema' => 'test',
                            'columns' => ['role_id'],
                            'referencedColumns' => ['id'],
                            'onUpdate' => 'CASCADE',
                            'onDelete' => 'CASCADE'
                        ]
                    )
                ],
                'options' => [
                    'TABLE_TYPE' => 'BASE TABLE',
                    'AUTO_INCREMENT' => '',
                    'ENGINE' => 'InnoDB',
                    'TABLE_COLLATION' => 'utf8_general_ci'
                ],
            ]
        );
    }

    /**
     * Run the migrations
     *
     * @return void
     */
    public function up()
    {

    }

    /**
     * Reverse the migrations
     *
     * @return void
     */
    public function down()
    {

    }

}
