<?php

namespace Application\Common\Models;

class ArticleComments extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(column="ac_id", type="integer", length=10, nullable=false)
     */
    public $ac_id;

    /**
     *
     * @var string
     * @Column(column="ac_content", type="string", length=255, nullable=false)
     */
    public $ac_content;

    /**
     *
     * @var string
     * @Column(column="ac_user", type="string", length=255, nullable=false)
     */
    public $ac_user;

    /**
     *
     * @var string
     * @Column(column="ac_pid", type="string", length=255, nullable=false)
     */
    public $ac_pid;

    /**
     *
     * @var string
     * @Column(column="created_at", type="string", nullable=true)
     */
    public $created_at;

    /**
     *
     * @var string
     * @Column(column="updated_at", type="string", nullable=true)
     */
    public $updated_at;

    /**
     *
     * @var integer
     * @Column(column="ac_article", type="integer", length=11, nullable=false)
     */
    public $ac_article;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("test");
        $this->setSource("article_comments");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'article_comments';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return ArticleComments[]|ArticleComments|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return ArticleComments|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
